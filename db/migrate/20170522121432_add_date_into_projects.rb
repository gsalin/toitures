class AddDateIntoProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :date, :date
  end
end
