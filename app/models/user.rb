class User < ActiveRecord::Base
	
	require 'digest/md5' 
	
	has_many :articles
	has_many :categories
	validates_length_of :name, :within => 6..16, :on => :create, :message => I18n.t('activemodel.errors.name_length')
	validates_length_of :pwd, :within => 6..40, :on => :create, :message => I18n.t('activemodel.errors.pwd_length')
	validates_format_of :name, :with => /^[a-zA-z0-9_]*$/, :on => :create, :message => I18n.t('activemodel.errors.name_format')
	validates_uniqueness_of :name, :on => :create, :message => I18n.t('activemodel.errors.name_unique')
	
	def t_save
		self.pwd = Digest::MD5.hexdigest(self.pwd)
		self.save
	end
end