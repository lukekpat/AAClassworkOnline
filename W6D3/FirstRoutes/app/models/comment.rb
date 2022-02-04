class Comment < ApplicationRecord
  validates :user_id, :artwork_id, presence: true 

  belongs_to :artwork,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: :Artwork

  
  belongs_to :commenter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User 
end
