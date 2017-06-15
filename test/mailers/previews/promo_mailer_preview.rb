# Preview all emails at http://localhost:3000/rails/mailers/promo_mailer
class PromoMailerPreview < ActionMailer::Preview
  def send_mail
    PromoMailer.send_mail(Promo.last.recipients.first, Promo.last)
  end
end
