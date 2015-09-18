class Url < ActiveRecord::Base
	belongs_to :dynamic
	# this call a parse to make it so the url will be http://[url]
  before_save :url_parse
  has_attached_file :image
	validates_attachment :image,
  :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] }

	private
		def url_parse
        	self.link.sub!(/www./, '')
        	if self.link.exclude? "http://"
        		self.link = "http://" << self.link
        	end
        end
end
