class PromoMailer < ApplicationMailer
  default from: 'promos@mscmgmt.cromon.co.uk'

  def send_mail(recipient, promo)
    @promo = promo
    @recipient = recipient

    access_token = PromoRecipient.where(promo_id: @promo.id, recipient_id: @recipient.id).first.access_token
    @url = 'http://localhost:3000/promos/' + "#{promo.id}/#{access_token}"
    mail(to: @recipient.email, subject: promo.title)
  end
end
