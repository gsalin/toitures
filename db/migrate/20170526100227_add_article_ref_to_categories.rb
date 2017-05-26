class AddArticleRefToCategories < ActiveRecord::Migration[5.0]
  def change
    add_reference :categories, :article, foreign_key: true
  end
end
