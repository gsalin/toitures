class RemoveDateFromProjects < ActiveRecord::Migration[5.0]
  def change
    remove_column :projects, :date, :string
  end
end
