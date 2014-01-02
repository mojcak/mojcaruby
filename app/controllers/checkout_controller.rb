#encoding: utf-8
class CheckoutController < ApplicationController
	def checkout
		if (session[:user_name]==nil)
			@checkout = "Prosimo, da se prijavite!"
		else
			@name = ""
			@surname = ""
			@email = ""
			@street = ""
			@num = ""
			@post = ""
			@city = ""

			if session[:userinfo] != nil
				@name = session[:userinfo]["name"]
				@surname = session[:userinfo]["surname"]
				@email = session[:userinfo]["email"]
				@street = session[:userinfo]["street"]
				@num = session[:userinfo]["num"]
				@post = session[:userinfo]["post"]
				@city = session[:userinfo]["city"]
				
			else
				#SELECT CUSTOMERS.customerId FROM mk0450_b1.CUSTOMERS WHERE customerUsername='$user'"

				# poglej če je v bazi kej...
				@username = session[:user_name]
				if (Customer.exists?(customerusername: @username))
					@customer = Customer.find_by customerusername: @username
					@name = @customer.customername
					@surname = @customer.customersurname
					@email = @customer.customeremail
					@street = @customer.customeraddressstreet
					@num = @customer.customeraddressstreetnum
					@post = @customer.customerpostnumber
					@city = @customer.customeraddresscity
				end
					
			end

			
			@a = "<h1>Vaši podatki</h1>"
			@a << '<%= form_tag("/checkout2", method: "post") do %>'
			@a << '<p>Preverite oz. dopolnite podatke! Vsi podatki so obvezni!</p>'
			@a << '<%= label_tag(:q, "Vaše ime:") %><%= text_field_tag :checkoutname, "'

			@a << @name.to_s
			@a << '" %><br />'
			@a << '<%= label_tag(:q, "Vaše priimek:") %><%= text_field_tag :checkoutsurname, "'
			@a << @surname.to_s
			@a << '"%>'
			@a << '<%= label_tag(:q, "Vaše e-mail naslov:") %><%= text_field_tag :checkoutemail, "'
			@a << @email.to_s
			@a << '" %><br />'
			@a << '<%= label_tag(:q, "Ulica:") %><%= text_field_tag :checkoutstreet, "'
			@a << @street.to_s
			@a << '" %>'
			@a << '<%= label_tag(:q, "Hišna številka:") %><%= text_field_tag :checkoutstreetnum, "'
			@a << @num.to_s
			@a << '" %><br />'
			@a << '<%= label_tag(:q, "Pošta:") %><%= text_field_tag :checkoutpost, "'
			@a << @post.to_s
			@a << '" %>'
			@a << '<%= label_tag(:q, "Kraj:") %><%= text_field_tag :checkoutcity, "'
			@a << @city.to_s
			@a << '" %><br />'
			@a << ' <%= submit_tag("Nadaljuj") %><% end %>'



			@checkout = @a
		end
	end
	def checkout2
		# preveri....
		if request.post?
			@name = params[:checkoutname]
			@surname = params[:checkoutsurname]
			@email = params[:checkoutemail]
			@street = params[:checkoutstreet]
			@num = params[:checkoutstreetnum]
			@post = params[:checkoutpost]
			@city = params[:checkoutcity]

			@i = 1
			if /^[A-Za-z ]{2,255}$/.match(@name)== nil
				@i = @i*0
				@name = ""
			else
				# match
			end

			if /^[A-Za-z ]{2,255}$/.match(@surname)== nil
				@i = @i*0
				@surname = ""
			else
				# match
			end
			
			if /^[a-zA-Z0-9_\.\-]+@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-\.]+$/.match(@email)== nil
				@i = @i*0
				@email  = ""
			else
				# match
			end
			if /^[A-Za-z ]{2,20}$/.match(@street)== nil
				@i = @i*0
				@street = ""
			else
				# match
			end
			if /^[0-9]{1,9999}[a-zA-Z0-9 \-]{0,3}$/.match(@num)== nil
				@i = @i*0
				@num = ""
			else
				# match
			end
			if /^[A-Za-z ]{2,20}$/.match(@city)== nil
				@i = @i*0
				@city = ""
			else
				# match
			end
			if /^[1-9]{1}[0-9]{3}$/.match(@post)== nil
				@i = @i*0
				@post = ""
			else
				# match
			end

			if @i == 0
				session[:userinfo] = {"name" => @name, "surname" => @surname, "email" => @email, "street" => @street, "num" => @num, "city"=>@city, "post" => @post}
				flash[:noticecheckout] = "Popravi podatke!"
				redirect_to :back
			else 
				#
				@username = session[:user_name]
				if Customer.exists?(customerusername: @username)
					@customer = Customer.find_by customerusername: @username
					@id = @customer.id
					#params[:user] = {:customername => @name, :customersurname => @surname, :customeraddressstreet => @street, :customeraddressstreetnum => @num, :customeraddresscity => @city, :customerPostNumber => @post.to_i, :customeremail => @email}
					Customer.where(:id => @id).update_all(:customername => @name, :customersurname => @surname, :customeraddressstreet => @street, :customeraddressstreetnum => @num, :customeraddresscity => @city, :customerpostnumber => @post.to_i, :customeremail => @email)
					@date = Date.today
					@idorder = Customerorders.create([{:customer_id => @id, :orderdate => @date}])
					@idorder = @idorder.last.id

					session[:cart].each do |k, v|
						logger.info k
						logger.info v
						Orderitem.create([{:orderquantity => v.to_i, :product_id => k.to_i, :customerorders_id => @idorder.to_i}])
	 					
	 				end
	 				session.delete(:userinfo)
	 				session.delete(:cart)

					flash[:noticecart] ="Vaš nakup je bil uspešno zaključen!"

				else 
					flash[:noticecart2] ="Vaš nakup ni bil uspešno zaključen!"
				end
			end

			
			
			#if (@email =~ /@/ &&  @name.length < 255 && @name.length >2 &&  @surname.length < 255 && @surname.length >2)
		  		#contact = Contacts.new(contactusername: @name, contactemail: @email, contactquery: @message)
		  		#if (contact.save)	
		  		#	@contactmessageOK = "Obrazec je bil uspešno poslan!"
		  		#else 
		  		#	@contactmessage = "Napaka pri pošiljanju obrazca..."
		  		#end
		  	#else 
		  		#@contactmessage = "Polja niso pravilno izpolnjena! Poskusite ponovno..."
		  	#end
		  


		
		

		
		end
	end
end
