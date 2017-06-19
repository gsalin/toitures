class CreateNeeds < ActiveRecord::Migration[5.0]
  def change
    create_table :needs do |t|
      t.string :address
      t.float :latitude
      t.float :longitude
      t.boolean :charpentier
      t.boolean :couvreur

      t.timestamps
    end
  end
end
