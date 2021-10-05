class CreateHygienes < ActiveRecord::Migration[6.1]
  def change
    create_table :hygienes do |t|
      t.string :full_name
      t.string :business_id
      t.string :plot_number
      t.string :lr_number
      t.string :physical_address
      t.string :nuture_of_business
      t.string :sub_county
      t.string :ward
      t.string :expiry_date

      t.timestamps
    end
  end
end
