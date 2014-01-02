class Customerorders < ActiveRecord::Base
	has_many :orderitems
	belongs_to :customer
end
