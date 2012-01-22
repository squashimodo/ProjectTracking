class AccessController < ApplicationController
	layout "logged_out"

  def index
  	menu
  end
  def menu
  	#visa text & länkar
  end

  def login
  end

  def attempt_login
  	# Run Authenticate-method with submitted params
  	authorized_user = User.authenticate(params[:username], params[:pw])
		
		# If the user was found and authenticated, mve to start page
		if authorized_user

			session[:user_id] = authorized_user.id
			session[:username] = authorized_user.username

			flash[:success] = "You are now logged in!"
			redirect_to(:controller => "projects", :action => "index")
		else
		# Else go back
			flash[:error] = "Invalid username or password"
			redirect_to(:action => "login")
		end  
end

  def logout
		session[:user_id] = nil
		session[:username] = nil
  	flash[:success] = "You successfully logged out!"
		redirect_to(:action => "login")  
	end
end
