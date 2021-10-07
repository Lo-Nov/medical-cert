class FireSerializer < ActiveModel::Serializer
  attributes :id, :business_name, :business_id, :plot_number, :street, :regitration_number, :vehicle_type, :inpection_date, :certification_date, :expiry_date
end
