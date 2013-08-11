class ChargeController < ApplicationController
	def create
		# Set your secret key: remember to change this to your live secret key in production
		# See your keys here https://manage.stripe.com/account
		Stripe.api_key = "sk_live_K6cIkyWqjZjhrj5pHQDY0BhI"

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
		company = params[:company]
		employeeID = params[:employeeID]
		resale_num = params[:resale_num]
		purchasing_name = params[:purchasing_name]

		# Hidden
		amount = params[:amount]
		description = "#{params[:description]}\n#{first_name}\n#{last_name}\n#{phone}\n#{email}\n#{company}\n#{employeeID}\n#{resale_num}\n#{purchasing_name}\n#{street_address}\n#{city}\n#{state}\n#{zip_code}"

		# Create the charge on Stripe's servers - this will charge the user's card
		begin
			charge = Stripe::Charge.create(
				# amount in cents
				:amount => amount,
				:currency => "usd",
				:card => token,
				:description => description
			)
			OrderConfirmationMailer.email(current_user, params[:description], Float(amount) / 100.0).deliver
			redirect_to '/charges/success'
			rescue Stripe::CardError => e
				# The card has been declined
				flash[:error] = e.to_s
				redirect_to '/charges/fail'
		end
	end

	def success
	end

	def fail
	end

end