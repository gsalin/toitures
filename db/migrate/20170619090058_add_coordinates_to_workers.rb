class AddCoordinatesToWorkers < ActiveRecord::Migration[5.0]
  def change
    add_column :workers, :latitude, :float
    add_column :workers, :longitude, :float
  end
end
