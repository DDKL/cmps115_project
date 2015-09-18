class SessionsController < Devise::SessionsController
	def create
		super
		#session[:user_id] = current_user.id
		#redirect_to user
	end
	
	def destroy
		super
		#session[:user_id] = nil
	end
end
