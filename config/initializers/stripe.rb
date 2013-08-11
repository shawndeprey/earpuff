Rails.configuration.stripe = {
  :publishable_key => ENV['PUBLISHABLE_KEY'] || 'pk_test_Wx2jUtfm9Rpi0tAhkaatzRaP',
  :secret_key      => ENV['SECRET_KEY'] || 'sk_test_dvSGjOoz7vfGeOBFBThWWjaN'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]