class User < ActiveRecord::Base
   include ActiveModel::Validations
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :orders
  has_many :comments

  #Basic usage. Defaults to minimum entrophy of 18 and no dictionary checking
  validates :password, password_strength: {min_entrophy: 1, use_dictionary: true}
end