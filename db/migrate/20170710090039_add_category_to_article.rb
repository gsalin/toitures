class AddCategoryToArticle < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :category, :integer
    add_index :articles, :category
  end
end
