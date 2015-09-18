class Box < ActiveRecord::Base
	belongs_to :user
	belongs_to :url
	
end
