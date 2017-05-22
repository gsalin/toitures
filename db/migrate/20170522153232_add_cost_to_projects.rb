class AddCostToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :cost, :integer
  end
end
