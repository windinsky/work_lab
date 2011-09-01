class AddVisiableToArticle < ActiveRecord::Migration
  def self.up
	add_column :articles, :visiable, :boolean, :default => true
  end

  def self.down
  	remove_column :articles, :visiable
  end
end
