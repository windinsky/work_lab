class ApplicationController < ActionController::Base
  
	def auth
		puts "==============================="
		puts "==============================="
		puts session[:user_id]
		puts "==============================="
		puts "==============================="
		if session[:user_id].nil?
			redirect_to login_path
		end
	end
	
	def current_user
		User.find(session[:user_id])
	end
  
end
