class PromoRecipient < ApplicationRecord
  belongs_to :promo
  belongs_to :recipient

  include Tokenable
end
