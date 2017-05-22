class RemoveCostFromProjects < ActiveRecord::Migration[5.0]
  def change
    remove_column :projects, :cost, :string
  end
end
