require 'rails_helper'

RSpec.describe User, type: :model do 
  #validations - Shoulda 
  #associations - Shoulda 
  #scope methods SPIRE 

  describe "validations" do 
    it {should validate_presence_of(:username)}
    it {should validate_presence_of(:session_token)}
    it {should validate_presence_of(:password_digest)}
  end

  describe "associations" do 
    it {should have_many(:goals)}
  end 

  describe "is_password" do
    let!(:user){create(:user)}

    context "with a valid password" do
      it "should return true" do
        expect(user.is_password?("password")).to be true
      end
    end
    context "with an invalid password" do 
      it "should return false" do
        expect(user.is_password?("random_not_password"))
      end 
    end
  end

  subject{ User.create!(username: 'sailor_taylor', password: 'password' )}

  describe "find_by_credentials" do 
    context "when username and password are valid" do
      it "should return the appropriate user" do 
        jonah = User.create!(username: 'jonah_hill', password: 'password')
        user = User.find_by_credentials('jonah_hill', 'password')

        expect(jonah.username).to eq(user.username)
        expect(jonah.password_digest).to eq(user.password_digest)
      end
    end

    context "when username and password are invalid" do 
      it "should return nil" do 
        mike = User.create(username: 'michael_cera', password: 'assword')
        user = User.find_by_credentials(username: 'michael_cera', password: 'nwefwefqefw')
        expect(user).to be_nil 
      end 
    end
  end
end