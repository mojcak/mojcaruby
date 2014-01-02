#encoding: utf-8
class ShowController < ApplicationController
	def show
		@id = params[:post_id].first.first
		
		if (Product.exists?(id: @id))
			@product = Product.find_by id: @id
			@album = @product.productalbum
			@artist = @product.productartist
			@pic = @product.productpathpicture
			@price = @product.productprice.to_f/100
			@price = @price.to_s
			@id = @product.id


			@str = '<h1>'
			@str << @album
			@str << '</h1><h2>'
			@str << @artist
			@str << '</h2><figure class = "dodajVKosarico"><img src="'
			@str << @pic
			@str << '" width="150" height="150">'

			@str << '<%= form_tag("/addtocart", method: "post") do %>'
			a = '<%= hidden_field :post_id, '
	  		a << @id.to_s
		  	a << '%>'
		  	@str << a
			@str <<	'<%= submit_tag("+ Dodaj €'
			@str << @price
			@str << '") %><% end %></figure>'

		
			# dodaj se info o albumu
			# ...
			@info = Albuminfo.find_by_sql(["SELECT albuminfos.albumsongtitle FROM products, albuminfos WHERE products.id = albuminfos.product_id AND products.id = ?", @id])
			@str << "<ol>"
			@info.each do |p|
				@str << '<li>'
				@str << p.albumsongtitle
				@str << '</li>'
			end

			@str << "</ol>"

			@showalbum = @str

		end

	end
	def addtocart
		@idItem = params[:post_id].first.first
		if session[:cart] == nil
			data = {@idItem => '1'}
			session[:cart] = data
			#logger.info session[:cart]
		
			#logger.info data #JSON.parse(session[:cart])
		else
			session[:cart][@idItem] = session[:cart][@idItem].to_i+1

			#session[:cart].each do |k, v|
			#	@idI = k	
			#	@quantity = v
			#end
		end
		flash[:noticeshow] ="Produkt dodan!"
		redirect_to :back and return
	end
	def removeitem
		@idItem = params[:post_id].first.first
		session[:cart][@idItem] = session[:cart][@idItem].to_i-1
		if session[:cart][@idItem]==0
			session[:cart].delete(@idItem)
		end
		redirect_to :back and return
	end
	def removeall
		session.delete(:cart)
		redirect_to :back 
	end
end
