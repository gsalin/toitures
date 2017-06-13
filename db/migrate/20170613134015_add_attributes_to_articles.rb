class AddAttributesToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :card_summary, :string
    add_column :articles, :summary, :text
  end
end
