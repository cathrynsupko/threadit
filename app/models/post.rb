class Post < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  has_many :comments
  
  validates :title, presence: true
  
  def self.author
    author = User.find(self.author_id)
  end
  
end
