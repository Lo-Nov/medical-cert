class CreateCerts < ActiveRecord::Migration[6.1]
  def change
    create_table :certs do |t|
      t.string :full_name
      t.string :id_number
      t.string :company_name
      t.string :business_id
      t.string :sub_county
      t.string :ward
      t.string :examined_at
      t.string :lab_ref_number
      t.string :expiry_date

      t.timestamps
    end
  end
end
