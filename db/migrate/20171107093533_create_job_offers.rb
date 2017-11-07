class CreateJobOffers < ActiveRecord::Migration[5.0]
  def change
    create_table :job_offers do |t|
      t.string :title
      t.string :job_type
      t.integer :reference
      t.text :description
      t.string :contact_name
      t.string :contact_phone_number
      t.integer :user_id
      t.text :mission
      t.text :profile
      t.text :diploma
      t.integer :experience
      t.integer :remuneration
      t.datetime :job_start_date_time

      t.timestamps
    end
  end
end
