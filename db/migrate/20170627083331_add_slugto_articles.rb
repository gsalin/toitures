class AddSlugtoArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :slug, :string, uniqueness: true
  end
end
