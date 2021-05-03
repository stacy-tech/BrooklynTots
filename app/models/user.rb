class User < ApplicationRecord
    
    has_secure_password 
    has_many :comments
    has_many :posts, through: :comments
    has_many :created_posts, class_name: "Post", foreign_key: :creator_id
    


    validates :username, :email, presence: true, uniqueness: true 
end