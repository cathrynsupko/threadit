class User < ActiveRecord::Base
  has_many :posts, foreign_key: "author_id"
  has_many :comments
  
  validates :name, presence: true
  has_secure_password
end
