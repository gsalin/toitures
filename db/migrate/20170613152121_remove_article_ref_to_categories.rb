class RemoveArticleRefToCategories < ActiveRecord::Migration[5.0]
  def change
    remove_reference :categories, :article, foreign_key: true
  end
end
