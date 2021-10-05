class HygieneSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :plot_number, :lr_number, :physical_address, :nuture_of_business, :expiry_date
end
