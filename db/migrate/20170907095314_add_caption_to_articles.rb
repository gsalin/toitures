class AddCaptionToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :caption, :string
  end
end
