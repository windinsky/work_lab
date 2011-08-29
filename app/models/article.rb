class Article < ActiveRecord::Base
	
	validates_presence_of :title, :on => :create, :message => ""
	validates_presence_of :category_id, :on => :create, :message => "can't be blank"
	validates_presence_of :user_id, :on => :create, :message => "can't be blank"
	validates_presence_of :content, :on => :create, :message => "can't be blank"
	
	belongs_to :user
	belongs_to :category
	
end
