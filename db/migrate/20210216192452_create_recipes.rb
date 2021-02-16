class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :ingredient
      t.integer :difficulty
      t.integer :time
      t.integer :rating
      t.integer :protein_id
    end 
  end
end
