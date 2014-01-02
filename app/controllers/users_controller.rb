require 'bcrypt'
class UsersController < ApplicationController
	def users
	end
	def signup
		if (request.post?)
			@username = params[:usernamenew]
			@pass1 = params[:userpasswordnew]
			@pass2 = params[:userpasswordnewdup]

			if (Customer.exists?(customerusername: @username))
				flash[:noticeusers] ="Uporabniško ime že obstaja"
				redirect_to :back and return
			else 
				if @pass1 == @pass2 && @pass1.length >3
					@salt = BCrypt::Engine.generate_salt
					@password = BCrypt::Engine.hash_secret(@pass1, @salt)
					user = Customer.new(customerusername: @username, customerpassword: @password, salt: @salt)
  					user.save!
  					session[:user_name] = @username
					#logger.info session[:user_name]
					redirect_to '/' 


				else 
					flash[:noticeusers2] ="Gesli se ne ujemata oz. sta prekratki"
					redirect_to :back and return
				end
			end
			# username ne sme obstajat v bazi
			# pass1 == pass2

			# bcrypt nardis

			# shrans use
		end
	end
	def signin
		if (request.post?)
			@username = params[:username]

			#password_salt = BCrypt::Engine.generate_salt
			#@password = BCrypt::Engine.hash_secret(params[:userpassword], password_salt)
			#logger.info password_salt
			if (Customer.exists?(customerusername: @username))
				@customer = Customer.find_by customerusername: @username
				@id = @customer.id
				@salt = @customer.salt
				if (BCrypt::Engine.valid_salt?(@salt))
					@password = BCrypt::Engine.hash_secret(params[:userpassword], @salt)
					if (@password == @customer.customerpassword)
						session[:user_name] = @username
						#logger.info session[:user_name]
						redirect_to '/' 
						
					else 
						flash[:noticeusers] ="Napačno uporabniško ime ali geslo!"
						redirect_to :back and return
					end
				
					
				end
				
			else 
				flash[:noticeusers] ="Napačno uporabniško ime ali geslo!"
				redirect_to :back and return
				
			end


		end
	end
end



# render :layout => 'another_layout'

