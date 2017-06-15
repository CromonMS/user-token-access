class Promo < ApplicationRecord
  has_many :promo_recipients
  has_many :recipients, through: :promo_recipients
  accepts_nested_attributes_for :recipients, reject_if: proc { |attrs| attrs['email'].blank? }

  validates_presence_of :title, :expiry_date
end
