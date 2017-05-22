class AddDateToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :date, :datetime
  end
end
