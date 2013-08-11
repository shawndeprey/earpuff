class DefaultController < ApplicationController
	skip_before_filter :require_verification, :only => [:contact] #:only => [:contact, :splash]

	def contact
		# contact.html.erb
	end

  def index
  	# index.html.erb
  end

  def splash
  	# splash.html.erb
  end

end