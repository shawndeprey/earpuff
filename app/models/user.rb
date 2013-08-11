class User < ActiveRecord::Base
	nilify_blanks
	# Attributes: 
	# :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :sign_in_count
	# :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip
	# 
	# Custom Attributes
	# t.boolean :admin, :default => false
  # t.boolean :approved, :default => false
  # t.string :company
  # t.string :ein
  # t.string :resale_number
  # t.string :purchase_name
  # t.string :first_name
  # t.string :last_name
  # t.string :title
	#
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable

  def full_name
    return "#{self.first_name} #{self.last_name}"
  end
end