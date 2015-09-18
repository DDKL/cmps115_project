class RegistrationsController < Devise::RegistrationsController
	def resource_name
		:user
	end

	def after_sign_in_path_for(resource_or_scope)
	  if resource_or_scope.is_a?(User)
	    static_pages_help_path   
	  else
	    super
	  end
	end
	

end