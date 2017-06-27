class RemoveSlugToArticles < ActiveRecord::Migration[5.0]
  def change
    remove_column :articles, :slug, :string, uniqueness: true
  end
end
