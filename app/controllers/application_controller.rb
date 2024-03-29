class ApplicationController < ActionController::Base
  protect_from_forgery

	protected # bara klassen och dess ungjävlar når metoden
	def confirm_logged_in
		unless session[:user_id]
			flash[:error] = "Please log in"
			redirect_to(:action => "login", :controller => "access" )
			return false # Stannar before_filer
		else
			return true
		end
	end

	def about
		render("about")
	end
end
