# frozen_string_literal: true
# Generate random access token
module Tokenable
  extend ActiveSupport::Concern

  included do
    before_create :generate_token
  end

  protected

  def generate_token
    self.access_token = loop do
      random_token = Digest::SHA256.hexdigest([Time.now, rand].join)
      break random_token unless self.class.exists?(access_token: random_token)
    end
  end
end
