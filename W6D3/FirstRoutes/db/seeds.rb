# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do
  User.destroy_all 
  Artwork.destroy_all
  ArtworkShare.destroy_all

  user1 = User.create!(username: 'CoolKid') #id 1
  user2 = User.create!(username: 'RadDude') #id 2
  user3 = User.create!(username: 'Michaelangelo') #id 3 
  user4 = User.create!(username: 'Lurker') #id 4 

  art1 = Artwork.create!(title: 'Mona Lisa', image_url: 'sample_1_1', artist_id: user1.id) # 1
  art2 = Artwork.create!(title: 'Starry Night', image_url: 'sample_1_2', artist_id: user1.id) # 2 
  art3 = Artwork.create!(title: 'Cool Ass Picture', image_url: 'sample_2_1', artist_id: user2.id) # 3 
  art4 = Artwork.create!(title: 'David Sculpture', image_url: 'sample_3_1', artist_id: user3.id) # 4 
  art5 = Artwork.create!(title: 'Tiny Pic', image_url: 'sample_3_2', artist_id: user4.id) # 5

  share1 = ArtworkShare.create!(artwork_id: art1.id, viewer_id: user4.id)
  share2 = ArtworkShare.create!(artwork_id: art3.id, viewer_id: user4.id)
end