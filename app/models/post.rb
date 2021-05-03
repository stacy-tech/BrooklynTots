class Post < ApplicationRecord
    belongs_to :creator, class_name: "User"
    has_many :comments 
    has_many :users, through: :comments

    validates :title, :content, presence: true

end