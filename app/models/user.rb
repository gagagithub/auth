class User < ActiveRecord::Base
#	attr_accessible :email, :password, :password_confirmation
	attr_accessor :password

#	attr_accessor :email, :password, :password_confirmation
	before_save:encrypt_password

	validates_confirmation_of :password
	validates_presence_of :password, :on=>:create
	validates_presence_of :email
	validates_uniqueness_of :email

	def encrypt_password
		if password.present?
			self.password_hash = password
		end
	end

	def self.authenticate(email,password)
		user = find_by_email(email)
		if user && password == user.password_hash
			user
		else
			nil
		end
	end
end
