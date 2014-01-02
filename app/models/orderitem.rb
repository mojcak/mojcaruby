class Orderitem < ActiveRecord::Base
	belongs_to :product
	belongs_to :customerorders
end
