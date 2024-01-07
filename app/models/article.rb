class Article < ApplicationRecord
include Visible

    paginates_per 1
    has_many :comments,dependent: :destroy
    has_one_attached :profile_image

    validates :title, presence: true 
    validates :body, presence: true, length: {minimum:3, maximum:30}
    
    
    
end
