class CreateFires < ActiveRecord::Migration[6.1]
  def change
    create_table :fires do |t|
      t.string :business_name
      t.string :business_id
      t.string :phone
      t.string :email
      t.string :plot_number
      t.string :street
      t.string :regitration_number
      t.string :vehicle_type
      t.string :inpection_date
      t.string :certification_date
      t.string :sub_county
      t.string :ward
      t.string :expiry_date

      t.timestamps
    end
  end
end
