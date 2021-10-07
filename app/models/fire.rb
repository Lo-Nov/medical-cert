class Fire < ApplicationRecord
  before_create :set_expiry_date

  validates :business_name, presence: true
  validates :business_id, presence: true

  def set_expiry_date
    self.expiry_date = Date.today + 364.days
  end
end
