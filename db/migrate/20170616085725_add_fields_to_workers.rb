class AddFieldsToWorkers < ActiveRecord::Migration[5.0]
  def change
    add_column :workers, :phone_number, :string
    add_column :workers, :last_name, :string
    add_column :workers, :first_name, :string
    add_column :workers, :address, :string
    add_column :workers, :looking_for_job, :boolean
  end
end
