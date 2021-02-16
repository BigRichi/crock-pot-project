class CreateUserReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :user_reviews do |t|
      t.string :name
      t.integer :user_id
      t.integer :recipe_id
    end 
  end
end
