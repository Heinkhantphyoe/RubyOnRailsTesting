class Article < ApplicationRecord
include Visible

    def self.search(search)
        if search
        where('title LIKE :search OR body LIKE :search',search: "%#{search}%")
        else
            all

        end
    end

    paginates_per 5
    has_many :comments,dependent: :destroy
    has_one_attached :profile_image

    validates :title, presence: true 
    validates :body, presence: true, length: {minimum:3, maximum:30}
    
    
    
end
