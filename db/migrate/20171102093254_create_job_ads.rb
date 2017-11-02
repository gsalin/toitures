class CreateJobAds < ActiveRecord::Migration[5.0]
  def change
    create_table :job_ads do |t|
      t.integer :user_id
      t.string :title
      t.string :string
      t.string :diploma
      t.text :description
      t.integer :experience
      t.integer :remuneration
      t.string :civilite

      t.timestamps
    end
  end
end
