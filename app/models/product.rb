class Product < ActiveRecord::Base
  has_many :orders
  has_many :comments
end
def self.search(search_term)
  Product.where("name LIKE ?", "%#{search_term}%")
end
