module UrlsHelper
	require 'uri'
	require "net/http"
	def url_exist?(url_string)
	  url = URI.parse(url_string)
	  req = Net::HTTP.new(url.host, url.port)
	  req.use_ssl = (url.scheme == 'https')
	  path = url.path if url.path.present?
	  begin
	  	res = req.request_head(path || '/')
	  rescue SocketError => e
	  	return false
	  end
	  if res.kind_of?(Net::HTTPRedirection)
	    url_exist?(res['location']) # Go after any redirect and make sure you can access the redirected URL 
	  else
	    ! %W(4 5).include?(res.code[0]) # Not from 4xx or 5xx families
	  end
	rescue Errno::ENOENT
	  return false #false if can't find the server
	end
  def url_stored?(url_string)
    url_string.sub!(/www./, '')
    if url_string.include? "https://"
      url_string.sub!(/https:\/\//, '')
    end
    if url_string.exclude? "http://" 
      url_string = "http://" << url_string
    end
    puts "#{url_string}"
    found = Url.find_by_link(url_string)
    return found
  end
end
