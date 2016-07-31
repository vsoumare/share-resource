class TweetsController < ApplicationController
    before_action :get_tweet, only: [:edit, :update, :destroy]
    before_action :check_auth, only => [:edit, :update, :destroy]
        def get_tweet
            @tweet = Tweet.find(params[:id])
        end
        def check_auth
            if session[:zombie_id] != @tweet.zombie_id
                flash[:notice] = "Sorry, you can't edit this tweet"
                redirect_to(tweets_path)
                #or redirect_to(tweets_path, notice: "Sorry, you can't edit this tweet")
             end
        end
    def show
        @tweet = Tweet.find(params[id])
        respond_to do |format|
            format.html # show.html.erb
            format.json { render json: @tweet }
            format.xml { render xml: @tweet }
        end
    end
    private
    def tweet_params
        @tweet = Tweet.create(params.require(:tweet).permit(:status))
        @tweet = Tweet.create(params[:tweet])
    end
    def edit 
        
        
        
    end
    def update
    end
    def destroy
    end
    def index
        if params[:zipcode]
            @tweets = Tweet.where(zipcode: params[:zipcode])
       
        else
            @tweets = Tweet.all
        end
        respond_to do |format|
            format.html # index.html.erb
            format.xml {render xml: @tweets}
        end
    end
    
    if params[:name]
        @zombie = Zombie.where(name: params[:name]).first
        @tweets = @zombie.tweets
    else
        @tweets = Tweeet.all
    end
end