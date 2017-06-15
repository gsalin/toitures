class AddCategoryReferenceToArticles < ActiveRecord::Migration[5.0]
  def change
    add_reference :articles, :category, foreign_key: true, index: true
  end
end
