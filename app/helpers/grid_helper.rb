module GridHelper
	def crawler_test(url)
		side_size = 300
		crop_side_size = side_size-50
		@kit = IMGKit.new(url,
						:quality => 50,
                      	:width   => side_size,
                      	:height  => side_size,
                      	"crop-h" => crop_side_size,
                      	"disable-smart-width" => true,
                      	"zoom" => 0.2)
		send_data(@kit.to_png, :type => "image/png", :disposition => 'inline' )
	end
end
