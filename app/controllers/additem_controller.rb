#encoding: utf-8
class AdditemController < ApplicationController

 def additem
 	if session[:user_name] == "admin"

	 	@album = params[:album]
		@artist = params[:artist]
		@price = params[:price]
		@type = params[:type]

		@i = 1
		if /^[A-Za-z 0-9.?*!#\$%&]{2,255}$/.match(@album)== nil
			@i = @i*0
			@album = ""
		else
			# match
		end
		if (/^[A-Za-z 0-9.*?!#\$%&]{2,255}$/.match(@artist)== nil)
			@i = @i*0
			@artist = ""
		else
			# match
		end
		if (!@price.to_f)
			@i = @i*0
			@price = ""
		else
			@price = @price.to_f*100
			@price = @price.to_i
			# match
		end
		if (/^[cClL]{1}[dDpP]{1}$/.match(@type)== nil)
			@i = @i*0
			@type = ""
		else
			if @type == "cd"
				@type = "CD"
			elsif @type == "lp"
				@type = "LP"
			end
				
			# match
		end

		if (@i == 0)
			#session[:userinfo] = {"name" => @name, "surname" => @surname, "email" => @email, "street" => @street, "num" => @num, "city"=>@city, "post" => @post}
			flash[:noticeadditem] = "Napačno izpolnjeni podatki"
			redirect_to :back
		else 
			session[:product] = {"productartist" => @artist, "productalbum" =>@album, "productprice"=>@price, "producttype"=>@type}
			#product = Product.new(:)
  			#product.save
		end
	end
end
def upload
	# shrani v bazo

  	uploaded_io = params[:picture]
  	@path = "/assets/"
  	@path << uploaded_io.original_filename
  	product = Product.new(productartist: session[:product]["productartist"], productalbum: session[:product]["productalbum"], productprice: session[:product]["productprice"], producttype: session[:product]["producttype"], productpathpicture: @path)
  	productsave = product.save
  	session[:id] = {"id" => product.id}
  	# shrani si id v session...
  	File.open(Rails.root.join('app/assets', 'images', uploaded_io.original_filename), 'wb') do |file|
    	file.write(uploaded_io.read)
  	end
  	session.delete(:product)

  	logger.info "bla"
  	redirect_to "/upload"
end
def addsong
	@albumsongtitle = params[:songname]
	@product_id = session[:id]["id"]

	if (@albumsongtitle != nil)
	album = Albuminfo.new(albumsongtitle: @albumsongtitle, product_id: @product_id)
	album.save
	@add = "Pesem "
	@add << @albumsongtitle
	@add << " dodana!"
 flash[:noticeitem] = @add

	#redirect_to '/'
	end
end
def noaddsong
	session.delete(:id)
	redirect_to '/'
end

end
