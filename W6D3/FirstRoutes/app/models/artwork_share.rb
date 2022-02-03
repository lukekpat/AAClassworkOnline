class ArtworkShare < ApplicationRecord
  
  belongs_to :artwork,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: :Artwork

  belongs_to :viewer,
    primary_key: :id,
    foreign_key: :viewer_id,
    class_name: :User


  validates :artwork, :viewer, presence: true 
  validates :artwork_id, uniqueness: { scope: :viewer_id, 
    message: "cannot be shared more than once with same viewer!" }

end