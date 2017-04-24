class AddAttributesToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :company, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :position, :string
    add_column :users, :office_phone, :string
    add_column :users, :mobile_phone, :string
    add_column :users, :address, :string
    add_column :users, :description, :text
  end
end
