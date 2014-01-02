class LogoutController < ApplicationController
	def logout
		session.delete(:user_name)
		redirect_to '/'
	end
end
