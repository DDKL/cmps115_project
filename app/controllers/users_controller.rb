class UsersController < ApplicationController
	before_filter :authenticate_user!
	#this will be for admin management

	#urlhelper contains the url_exist? function that checks if the url works
  	include UrlsHelper
	def show
		@user = User.find(current_user.id)
		#incoming data for saving dragged boxes
		if params.has_key?("xCoor")
			xCoor 	 	 = params[:xCoor]
			yCoor 	 	 = params[:yCoor]
			draggedBoxId = params[:draggedBoxId]

			for i in @user.boxes
				#.to_s => converts to string
				if i.id.to_s == draggedBoxId.to_s
					i.update_attribute(:xCoor, xCoor)
					i.update_attribute(:yCoor, yCoor)
				end
			end
		end
		#incoming data for saving resized boxes
		if params.has_key?("width")
			width 	 	 = params[:width]
			height 	 	 = params[:height]
			resizedBoxId = params[:resizedBoxId]

			for i in @user.boxes
				#.to_s => converts to string
				if i.id.to_s == resizedBoxId.to_s
					i.update_attribute(:width, width)
					i.update_attribute(:height, height)
				end
			end
		end
		#incoming data for saving sub reddits
		if params.has_key?("subReddit")
			redditId = params[:redditId]
			subReddit = params[:subReddit]

			for i in @user.boxes
				if i.id.to_s == redditId.to_s
					i.update_attribute(:subReddit, subReddit)
				end
			end
		end
		if params.has_key?("imgURL")
			imgURL = params[:imgURL]
			@user.update_attribute(:bgimage, imgURL)
		end

		#incoming data for deleting background
		if params.has_key?("deleteBg")
			@user.update_attribute(:bgimage, "")
		end

		if params.has_key?("searchClick")
			searchClick = params[:searchClick]
			@user.update_attribute(:enableSearchBar, searchClick)
		end

		#incoming data for deleting a box
		if params.has_key?("deleteId")
			@user.boxes.destroy(params[:deleteId])
		end

	end

end