class ApplicationController < ActionController::Base

	layout "another"
 
	layout :another_by_method
	private
	def another_by_method
		if session[:user_name] == "admin"
			"admin"
		else 
			"application"
		end
	end
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
