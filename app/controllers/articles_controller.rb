class ArticlesController < ApplicationController
	#require "auth"
	before_filter :auth
	
	def index
		@title = "文章列表"
		@articles = current_user.articles.visiable
	end
	
	def show
		@article = Article.find(params[:id])
		@title = @article.title
	end
	
	def new
		@title = "新建一篇文章"
		@categories = current_user.categories
	end
	
	def create
		article = Article.new({:title => params[:title],:content => params[:content], :user_id => session[:user_id], :category_id => params[:category_id]})
		if article.save
			redirect_to "/articles/show/#{article.id}"
		else
			flash[:msg] = article.errors.collect{|key,value| value}.join("  ,  ")
			redirect_to "/articles/new"
		end
	end
	
	def edit
		@article = current_user.articles.find(params[:id])
		if @article
			@categories = current_user.categories
		else
			
		end
		
	end
	
	def update
		article = current_user.articles.find(params[:id])
		if article.update_attributes({:title => params[:title],:content => params[:content], :category_id => params[:category_id]})
			redirect_to "/articles/show/#{article.id}"
		else
			flash[:msg] = article.errors.collect{|key,value| value}.join("  ,  ")
			redirect_to "/articles/edit/#{params[:id]}"
		end
	end
	
	def delete
		article = current_user.articles.find(params[:id])
		render(:text => article.update_attributes({:visiable => false}) ? "1" : "0") 
	end
end
