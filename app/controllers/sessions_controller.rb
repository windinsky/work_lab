class SessionsController < ApplicationController
	require 'digest/md5' 
	def new
		@title = "登录"
	end
	
	def create
		user = User.find(:first,:conditions=>{
			:name=>params[:name],
			:pwd=> Digest::MD5.hexdigest(params[:pwd])
		})
		if user
			flash[:msg] = "登录成功"
			session[:user_id] = user.id
			redirect_to index_path
		else
			flash[:msg] = "用户名或密码错误"
			redirect_to login_path
		end
	end
end