class Product < ActiveRecord::Base
  has_many :orders
  has_many :comments

def self.search(search_term)
  Product.where("name LIKE ?", "%#{search_term}%")
end

def highest_rating_comment
  comments.rating_desc.first
end

def lowest_rating_comment
  	comments.rating_asc.first
end
end