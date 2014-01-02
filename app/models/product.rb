class Product < ActiveRecord::Base
	has_many :albuminfos
	has_many :orderitems
end
