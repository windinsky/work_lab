class CategoriesController < ApplicationController
	def new
		
	end
	
	def create
		category = Category.new({:value => params[:value],:user_id => session[:user_id]})
		if category.save
			redirect_to "/categories/index"
		end
	end
	
	def index
		@categories = current_user.categories
	end
	
	def delete
		category = current_user.categories.find(params[:id])
		if category
			category.articles.each(:delete)
			category.delete
		end
		redirect_to "/categories/index"
	end
	
end
