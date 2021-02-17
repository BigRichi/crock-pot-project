class ChangeIngredientOfRecipes < ActiveRecord::Migration[5.2]
  def change
    change_column :recipes, :ingredient, :text
  end
end
