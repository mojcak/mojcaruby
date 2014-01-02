class Customer < ActiveRecord::Base
	has_many :customerorders
end
