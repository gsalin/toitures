class RemoveDateIntoProjects < ActiveRecord::Migration[5.0]
  def change
    remove_column :projects, :date, :datetime
  end
end
