class AddCaption2ToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :caption2, :string
  end
end
