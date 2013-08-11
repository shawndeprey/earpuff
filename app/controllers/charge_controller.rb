class ChargeController < ApplicationController
	def create
	# Set your secret key: remember to change this to your live secret key in production
	# See your keys here https://manage.stripe.com/account
	Stripe.api_key = "sk_test_dvSGjOoz7vfGeOBFBThWWjaN"

	# Get the credit card details submitted by the form
	token = params[:stripeToken]
	first_name = params[:first_name]
	last_name = params[:last_name]
	phone = params[:phone]
	email = params[:email]
	street_address = params[:street_address]
	city = params[:city]
	state = params[:state]
	zip_code = params[:zip_code]

	# Hidden
	amount = params[:amount]
	description = "#{params[:description]}\n#{first_name}\n#{last_name}\n#{phone}\n#{email}\n#{street_address}\n#{city}\n#{state}\n#{zip_code}"

	# Create the charge on Stripe's servers - this will charge the user's card
	begin
		charge = Stripe::Charge.create(
			# amount in cents
			:amount => amount,
			:currency => "usd",
			:card => token,
			:description => description
		)
		redirect_to '/charges/success'
		rescue Stripe::CardError => e
			# The card has been declined
			redirect_to '/charges/fail'
		end
	end
end