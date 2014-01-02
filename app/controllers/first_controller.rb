#encoding: utf-8
# logger.info __
class FirstController < ApplicationController
  def showproducts(type)
  	if (type == "A" || type == "ALL")
  		@pr = Product.find(:all)
  	elsif (type == "CD")
  		@pr = Product.scoped.where(:producttype => "CD")
  	elsif (type == "LP")
  		@pr = Product.scoped.where(:producttype => "LP")
  	end
  		
  		@vsebina = "<article>"
  		@pr.each do |p|
	  		@vsebina << "<figure>"
	  		@vsebina << '<%= form_tag("/show", method: "get") do %>'
 			
	  		a = '<%= hidden_field :post_id, '
	  		a << p.id.to_s
		  	a << '%>'
	  		@vsebina << a
	  		@vsebina << '<%= image_submit_tag("'
	  		@vsebina << p.productpathpicture
	  		@vsebina <<	'", :class => "albumPrikazi", :width => "150", :height => "150") %>'
	  		
			@vsebina << '<% end %>'
	  		@vsebina << '<figcaption><span class="izvajalec">'
	  		@vsebina << p.productartist
	  		@vsebina << "</span><br />"
		  	@vsebina << '<span class="album">'
		  	@vsebina << p.productalbum
		  	@vsebina << '</span><br /><span class="cena">€'
		  	@a = p.productprice.to_f
		  	@price = p.productprice.to_f / 100
		  	@price = @price.round(2)

		  	@vsebina << @price.to_s
			@vsebina << '</span></figcaption>'
	  		@vsebina << "</figure>"

	#'<figure><img class="albumPrikazi" src="'.$pathPic.'" alt="'.$proArt.'-'.$proAlb.'" width="150" height="150" id="';
	#                echo $proId.'"/><figcaption><span class="izvajalec">'.$proArt.'</span><br />';
	#                echo '<span class="album">'.$proAlb.'</span><br /><span class="cena">€'.$proPri.'</span></figcaption></figure>';
	  	end
	  	@vsebina << "</article>"
	  	if (type == "A")
		  	@index = @vsebina
  		elsif (type =="LP")
  			@LP = @vsebina
  		elsif (type =="CD")
  			@CD = @vsebina
  		elsif (type =="ALL")
  			@all = @vsebina
  		end
  end 

  def index
  	showproducts("A")
  end
  def contact
  	#
  	#@pass = BCrypt::Password.create("user")
  	#user = Customer.new(customerusername: "user", customerpassword: @pass)
  	#user.save!
  	#product = Product.new(productartist: "Amity In Fame", productalbum: "Dinner For One", productprice: "1099", productpathpicture: "/assets/Amity-In-Fame_Dinner-For-One.png", producttype: "CD")
  	#product.save
  	@contactmessage = ""
  	@contactmessageOK = ""
  	if request.post?
	  	@name = params[:contactname]
	  	@message = params[:message]
	  	@email = params[:contactemail]
	  	
	  	if (@email =~ /@/ &&  @name.length < 255 && @name.length >2 && @message.length < 255 && @message.length > 10)
	  		contact = Contacts.new(contactusername: @name, contactemail: @email, contactquery: @message)
	  		if (contact.save)	
	  			@contactmessageOK = "Obrazec je bil uspešno poslan!"
	  		else 
	  			@contactmessage = "Napaka pri pošiljanju obrazca..."
	  		end
	  	else 
	  		@contactmessage = "Polja niso pravilno izpolnjena! Poskusite ponovno..."
	  	end
	  end
  end
  def about

  end
  def faq

  end
  def info
  end
  def CD
  		@pr = Product.scoped.where(:producttype => "CD")
  		
  		
  		@vsebina = "<article>"
  		@pr.each do |p|
	  		@vsebina << "<figure>"
	  		@vsebina << '<%= form_tag("/show", method: "get") do %>'
 			
	  		a = '<%= hidden_field :post_id, '
	  		a << p.id.to_s
		  	a << '%>'
	  		@vsebina << a
	  		@vsebina << '<%= image_submit_tag("'
	  		@vsebina << p.productpathpicture
	  		@vsebina <<	'", :class => "albumPrikazi", :width => "150", :height => "150" ) %>'
	  		
			@vsebina << '<% end %>'
	  		@vsebina << '<figcaption><span class="izvajalec">'
	  		@vsebina << p.productartist
	  		@vsebina << "</span><br />"
		  	@vsebina << '<span class="album">'
		  	@vsebina << p.productalbum
		  	@vsebina << '</span><br /><span class="cena">€'
		  	@a = p.productprice.to_f
		  	@price = p.productprice.to_f / 100
		  	@price = @price.round(2)

		  	@vsebina << @price.to_s
			@vsebina << '</span></figcaption>'
	  		@vsebina << "</figure>"

	#'<figure><img class="albumPrikazi" src="'.$pathPic.'" alt="'.$proArt.'-'.$proAlb.'" width="150" height="150" id="';
	#                echo $proId.'"/><figcaption><span class="izvajalec">'.$proArt.'</span><br />';
	#                echo '<span class="album">'.$proAlb.'</span><br /><span class="cena">€'.$proPri.'</span></figcaption></figure>';
	  	end
	  	@vsebina << "</article>"
	  	@CD = @vsebina
  		
  end
  def LP
  	@pr = Product.scoped.where(:producttype => "LP")
  	@vsebina = "<article>"
  		@pr.each do |p|
	  		@vsebina << "<figure>"
	  		@vsebina << '<%= form_tag("/show", method: "get") do %>'
 			
	  		a = '<%= hidden_field :post_id, '
	  		a << p.id.to_s
		  	a << '%>'
	  		@vsebina << a
	  		@vsebina << '<%= image_submit_tag("'
	  		@vsebina << p.productpathpicture
	  		@vsebina <<	'", :class => "albumPrikazi", :width => "150", :height => "150" ) %>'
	  		
			@vsebina << '<% end %>'
	  		@vsebina << '<figcaption><span class="izvajalec">'
	  		@vsebina << p.productartist
	  		@vsebina << "</span><br />"
		  	@vsebina << '<span class="album">'
		  	@vsebina << p.productalbum
		  	@vsebina << '</span><br /><span class="cena">€'
		  	@a = p.productprice.to_f
		  	@price = p.productprice.to_f / 100
		  	@price = @price.round(2)
		  	@vsebina << @price.to_s
			@vsebina << '</span></figcaption>'
	  		@vsebina << "</figure>"
	  	end
	  	@vsebina << "</article>"
	  	@LP = @vsebina
  end
  def all
  	showproducts("ALL")
  end
  def orders
  	if session[:user_name]!=nil
  		@b = '<h1>Naročila</h1>'
		@username = session[:user_name]
		if @username != "admin"
			if (Customer.exists?(customerusername: @username))
				@customer = Customer.find_by customerusername: @username
				@id = @customer.id
				@b << '<table class="postavke"><thead><tr><td>Št. naročila</td><td>Datum naročila</td><td>Izdelki</td><td>Skupaj cena</td></tr></thead><tbody id="tbodyKosarica">'
				@customerorder = Customerorders.find_by_sql(["SELECT customerorders.id, customerorders.orderdate FROM customerorders, customers WHERE customerorders.customer_id=customers.id AND customers.id =?", @id])
		  		
		  		@i = 0
		  		@customerorder.each do |p|
		  			@orderdate = p.orderdate
		  			@customerorderid = p.id
		  			@c = ""
		  			@pricetotal = 0
		  			@products = Product.find_by_sql(["SELECT * FROM products, orderitems, customerorders WHERE customerorders.id = ? AND customerorders.customer_id =? AND customerorders.id = orderitems.customerorders_id AND orderitems.product_id = products.id",@customerorderid, @id])
		  			@products.each do |o|
		  				@productartist = o.productartist
		  				@productalbum = o.productalbum
		  				@productprice = o.productprice
		  				@orderquantity = o.orderquantity
		  				@c << '<b>'
		  				@c << @productartist
		  				@c << '</b>-<i>'
		  				@c << @productalbum 
		  				@c << '</i>: €'
		  				@c << (@productprice.to_f/100).to_s
		  				@c << ' x '
		  				@c << @orderquantity.to_s
		  				@c << '<br />'
		  				@pricetotal = @pricetotal + @orderquantity.to_f * @productprice.to_f/100
		  			end

		  			@b <<'<tr><td>'
		  			@b << @customerorderid.to_s
		  			@b << '</td><td>'
		  			@b << @orderdate.to_s
		  			@b << '</td><td>'
		  			@b << @c
		  			@b << '</td><td><b>€'
		  			@b << @pricetotal.to_s
			  		@b << '</b></td></tr>'
			  		@i = @i +1
			  	end

			  	@b << '</tbody></table>'

			  	if @i ==0
					@order ="<p>Niste opravili še nobenega nakupa! </p>"
				else
			  		@order = @b
		  		end

			end
		else 
			# admin
			@b ='<table class="postavke"><thead><tr><td>ID</td><td>Priimek, ime</td><td>E-mail</td><td>Naslov</td><td>Število naročil</td><td>Število izdelkov</td><td>Cena</td></tr></thead><tbody id="tbodyKosarica">';
			@totalprice = 0
			@customers = Customer.find_by_sql(["SELECT * FROM customers"])
			@customers.each do |c|
				@customerid = c.id
				@customername = c.customername.to_s
				@customersurname = c.customersurname.to_s
				@customeremail = c.customeremail.to_s
				@customeraddressstreet = c.customeraddressstreet.to_s
				@customeraddressnum = c.customeraddressstreetnum.to_s
				@customeraddresscity = c.customeraddresscity.to_s
				@customerpostnumber = c.customerpostnumber.to_s

				@b << '<tr><td>'


				a = '<%= form_tag("/aboutuser", method: "get") do %>'
				a << '<%= hidden_field :id, '
			  	a << @customerid.to_s
				a << '%>'
				a << '<%= submit_tag("'
				a << @customerid.to_s
				a << '") %><% end %>'
				@b << a

				@b << '</td><td>'
				@b << @customersurname
				@b << ' '
				@b << @customername
				@b << '</td><td><a href="mailto:'
				@b << @customeremail
				@b << '">'
				@b << @customeremail
				@b << '</a></td><td>'
				@b << @customeraddressstreet
				@b << ' '
				@b << @customeraddressnum
				@b <<'<br/>'
				@b << @customerpostnumber
				@b <<' '
				@b << @customeraddresscity
				@b << '</td>'

				@steviloNarocil=0;
				@steviloIzdelkov = 0;
				@skupajCena = 0;


				@orders = Customerorders.find_by_sql(["SELECT customerorders.id FROM customerorders, customers WHERE customerorders.customer_id=? AND customers.id=?", @customerid, @customerid])
				@orders.each do |o|
					@orderid = o.id
					@steviloNarocil = @steviloNarocil+1

					@orderitems = Orderitem.find_by_sql(["SELECT * FROM customerorders, customers, orderitems WHERE customerorders.id=? AND orderitems.customerorders_id=? AND customers.id =?", @orderid, @orderid, @customerid])
					@orderitems.each do |oi|
						@productid = oi.product_id
						@quantity = oi.orderquantity
						
						@steviloIzdelkov = @steviloIzdelkov + @quantity

						@products = Product.find_by_sql(["SELECT * FROM orderitems,customerorders, customers, products WHERE orderitems.product_id=? AND products.id=? AND customerorders.id = ? AND customers.id=? AND orderitems.customerorders_id=?", @productid, @productid, @orderid, @customerid, @orderid])
						@products.each do |p|
							@productprice = p.productprice
							@skupajCena = @skupajCena + @productprice.to_f/100 *@quantity
						end


					end

				end
				@totalprice = @totalprice + @skupajCena
				@b << '<td>'
				@b << @steviloNarocil.to_s
				@b << '</td><td>'
				@b << @steviloIzdelkov.to_s
				@b <<'</td><td><b>€'
				@b << @skupajCena.to_s
				@b << '</b></td></tr>'

			end
		  		
		  	@b << '</tbody><tfoot><tr><td id="skupajCena" colspan="7">€'
		  	@b << @totalprice.to_s
		  	@b << '</td></tr></tfoot></table>';
			@order = @b
		end
  	else 
  		@order = "Za ogled naročil se prijavite!"
  	end
  end

  def aboutuser
  	@id = params[:id].first.first
  	if (session[:user_name]=="admin")
  		@user = Customer.find_by id: @id
  		@customername = @user.customername
  		@customersurname = @user.customersurname
  		@customeremail = @user.customeremail
  		@customeraddressstreet = @user.customeraddressstreet
  		@customeraddressstreetnum = @user.customeraddressstreetnum
  		@customeraddresscity = @user.customeraddresscity
  		@customerpostnumber = @user.customerpostnumber

  		a = '<h1>'
  		a << @id
  		a << ': '
  		a << @customersurname
  		a << ', '
  		a << @customername
  		a << '</h1>'
		a << '<p><a href="mailto:'
		a << @customeremail
		a << '">'
		a << @customeremail
		a << '</a><br />'
		a << @customeraddressstreet
		a << ' '
		a << @customeraddressstreetnum
		a << '<br />'
		a << @customerpostnumber.to_s
		a << ' '
		a << @customeraddresscity
		a << '</p>'
		a << '<h2>Pregled naročil uporabnika</h2>'
		a << '<table class="postavke"><thead><tr><td>ID naročila</td><td>Datum naročila</td><td>Izdelki</td><td>Skupaj cena</td></tr></thead><tbody id="tbodyKosarica">'
		@customerorder = Customerorders.find_by_sql(["SELECT customerorders.id, customerorders.orderdate FROM customerorders, customers WHERE customerorders.customer_id=customers.id AND customers.id =?", @id])
		@customerorder.each do |c|
			@orderdate = c.orderdate
		  	@customerorderid = c.id

		  	a << '<tr><td>'
		  	a << @customerorderid.to_s
		  	a << '</td><td>'
		  	a << @orderdate.to_s
		  	a << '</td>'
			a << '<td>'

			b = ""
			skupajCena = 0

			@products = Product.find_by_sql(["SELECT * FROM products, orderitems, customerorders WHERE customerorders.id = ? AND customerorders.customer_id =? AND customerorders.id = orderitems.customerorders_id AND orderitems.product_id = products.id",@customerorderid, @id])
		  	@products.each do |o|
		  		@productartist = o.productartist
		  		@productalbum = o.productalbum
		  		@productprice = o.productprice
		  		@orderquantity = o.orderquantity
		  		skupajCena = skupajCena+@orderquantity.to_f * @productprice.to_f/100
		  		b << @orderquantity.to_s
		  		b << 'x '
		  		b << @productartist
		  		b << '-'
		  		b << @productalbum
		  		b << ': '
		  		b << (@productprice.to_f/100).to_s
		  		b << '<br />'
			end
			a << b		
			a << '</td><td>'
			a << skupajCena.to_s
			a << '</td>'
		end
		a << '</tbody></table>'
		@aboutuser = a
  	end
  end

  def cart
  	if session[:cart] != nil
	  	@tabela = '<table class="postavke"><thead><tr><td colspan="2">Album</td><td>Količina</td><td></td><td>Skupaj cena</td></tr></thead><tbody id="tbodyKosarica">'
	  	@skupajCena = 0
	  	session[:cart].each do |k, v|
				@idI = k
				if (Product.exists?(id: @idI))
					@product = Product.find_by id: @idI
					@album = @product.productalbum
					@artist = @product.productartist
					@pic = @product.productpathpicture
					@price = @product.productprice.to_f/100
					@quantity = v
					@vmesnaCena = @price.to_f*@quantity.to_f
					@skupajCena = @skupajCena + @price.to_f*@quantity.to_f
					@price = @price.to_s	
					
					
					@tabela << '<tr><td><img src="'
					@tabela << @pic
					@tabela << '" width="50" height="50"></td><td><span class="izvajalec">'
					@tabela << @artist
					@tabela << '</span><br /><span class="album">'
					@tabela << @album
					@tabela << '</span></td><td>'
					@tabela << @quantity.to_s
					@tabela << 'x '
					@tabela << @price
					@tabela << '€</td><td>'

					a = '<%= form_tag("/removeitem", method: "post") do %>'
					a << '<%= hidden_field :post_id, '
			  		a << @idI.to_s
				  	a << '%>'
				  	
					a <<	'<%= submit_tag("Odstrani") %><% end %>'
					@tabela << a
					@tabela << '</td><td>€'
					@tabela << @vmesnaCena.to_s
					@tabela << '</td></tr>';
			
				end

		end
		@tabela << '</tbody><tfoot><tr><td id="skupajCena" colspan="5">€'
		@tabela << '%.2f' % @skupajCena
		@tabela << '</td></tr></tfoot></table>'
		
		a = '<%= form_tag("/removeall", method: "post") do %>'
		a << '<%= submit_tag("Odstrani vse") %><% end %>'
		@tabela << a
		a = '<%= form_tag("/checkout", method: "post") do %>'
		a << '<%= submit_tag("Nadaljuj") %><% end %>'
		@tabela << a
	  	
	  	@izpis = @tabela
	else 
		@izpis = "<p>V košarici nimate nobenih izdelkov!</p>"
	end
  end

  def search
  	@search = params[:search]
  	@i = 0
	@pr = Product.find_by_sql(["SELECT * FROM products WHERE products.productartist like ? OR products.productalbum like ?", "%#{@search}%", "%#{@search}%"])
  	@vsebina = "<article>"
  		@pr.each do |p|
  			@i = @i +1
	  		@vsebina << "<figure>"
	  		@vsebina << '<%= form_tag("/show", method: "get") do %>'
 			
	  		a = '<%= hidden_field :post_id, '
	  		a << p.id.to_s
		  	a << '%>'
	  		@vsebina << a
	  		@vsebina << '<%= image_submit_tag("'
	  		@vsebina << p.productpathpicture
	  		@vsebina <<	'", :class => "albumPrikazi", :width => "150", :height => "150" ) %>'
	  		
			@vsebina << '<% end %>'
	  		@vsebina << '<figcaption><span class="izvajalec">'
	  		@vsebina << p.productartist
	  		@vsebina << "</span><br />"
		  	@vsebina << '<span class="album">'
		  	@vsebina << p.productalbum
		  	@vsebina << '</span><br /><span class="cena">€'
		  	@a = p.productprice.to_f
		  	@price = p.productprice.to_f / 100
		  	@vsebina << @price.to_s
			@vsebina << '</span></figcaption>'
	  		@vsebina << "</figure>"
	  	end
	  	@vsebina << "</article>"
	  	if (@i == 0)
	  		@result = "Žal ni iskanih rezultatov..."
		  	
		else
			@result = @vsebina
		end
  end
end
def addproduct
	
end

