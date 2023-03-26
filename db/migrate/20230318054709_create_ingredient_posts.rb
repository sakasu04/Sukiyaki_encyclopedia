class CreateIngredientPosts < ActiveRecord::Migration[6.1]
  def change
    create_table :ingredient_posts do |t|
      t.text :body,     null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
