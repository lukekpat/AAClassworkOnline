class User < ApplicationRecord
  validates :username, :session_token, :password_digest, presence: true 
  
  has_many :goals,
    foreign_key: :user_id,
    class_name: :Goal 
end
