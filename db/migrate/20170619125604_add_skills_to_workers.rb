class AddSkillsToWorkers < ActiveRecord::Migration[5.0]
  def change
    add_column :workers, :charpentier, :boolean
    add_column :workers, :couvreur, :boolean
  end
end
