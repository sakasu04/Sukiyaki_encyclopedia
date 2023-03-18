class AddFavoriteIngredientToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :favorite_ingredient, :string
  end
end
