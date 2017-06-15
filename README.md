# README

This is a simple demo app for a custom user-token-access system.

- Clone the repo

- bundle install

- rake db:migrate

The home page will allow you to add a 'Promo' with 2 recipients, upon creation a Mailer creates an email for recipients in the tmp/mail folder (for testing) and also generates a unique access token for each user to view the page.

You must set an expiry date for each 'Promo', and if you attempt to view a 'Promo' with either an incorrect / missing token or past an Expiry Date you will either hit a Denied or Expired page respectively.

You can view each 'Promo' page as each user from the index.

You can view the mailer template @ http://localhost:3000/rails/mailers/promo_mailer/send_mail

TODO:

- Proper Tests ;)
