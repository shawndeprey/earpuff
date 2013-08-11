class DefaultController < ApplicationController
	skip_before_filter :require_verification, :only => [:contact, :index]

  def index
    # index.html.erb
    if user_signed_in?
      redirect_to products_path
    end
  end

	def contact
		# contact.html.erb
	end

  def product
    #product.html.erb
  end

end