class DefaultController < ApplicationController
	skip_before_filter :require_verification, :only => [:contact, :index]

  def index
    # index.html.erb
  end

	def contact
		# contact.html.erb
	end

  def product
    #product.html.erb
    @user = current_user
  end

end