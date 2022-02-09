FactoryBot.define do 
  factory :user do 
    username{Faker::TvShows::SouthPark.character}
    password{'password'}
    age{25}
  end 
end 