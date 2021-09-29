class Cert < ApplicationRecord

  before_create :set_expiry_date

  validates :full_name, presence: true
  validates :id_number, presence: true
  validates :lab_ref_number, presence: true, uniqueness: true


  def set_expiry_date
    self.expiry_date = Date.today + 182.days
  end
end
