class CreateSignups < ActiveRecord::Migration
  def change
    create_table :signups do |t|
      t.text_area :email
      t.timestamps
    end
  end
end
