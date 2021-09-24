class CertSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :id_number, :company_name, :business_id, :examined_at, :lab_ref_number, :expiry_date
end
