class UsersController < ApplicationController
	
	
	def index
		@users = User.all
	end
	
	def new
		@title = "注册"
	end

	def create
		user = User.new({:name => params[:name], :pwd => params[:pwd]})
		if user.t_save
			flash[:msg] = "注册成功";
			redirect_to login_path\
		else
			flash[:msg] = user.errors.collect{|key,value| value}.join("  、  ")
			redirect_to "/users/new"
		end
	end
	
	def edit
		
	end
	
	def update
		
	end
	
	def delete
		
	end
	
	def exist
		user = User.find(:first,:conditions => {:name => params[:name]})
		json = {
			:correct => user ? false : true, 
			:msg => user ? "该用户名已经被别人注册了，再换一个？" : ""
		}
		respond_to do |wants|
			wants.json { render(:text => json.to_json) } 
		end
	end
	
	# 	def collect
	# 	@serial = params[:n]
	# 	@text = ["奥巴马是人才！","奥巴马辞职，出任央视主播","奥巴马发布记者招待会","奥巴马认为央视工资更高"][@serial.to_i]
	# 	@length = @text.length*2
	# 	respond_to do |wants|
	# 		wants.html { render "collect.js.erb" }
	# 		wants.js { render "collect.js.erb" }
	# 	end
	# end
	
end
