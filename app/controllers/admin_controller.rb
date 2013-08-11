class AdminController < ApplicationController
	before_filter :require_admin_session

  def approve_index
  	@users = User.where(approved: false)
  end

  def approve_user
  	user = User.find_by_id(params[:id])
  	if user
  		user.approved = true
  		user.save
  	end
  	redirect_to approve_users_path
  end

end