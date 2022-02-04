class UsersController < ApplicationController

  def index
    if !params[:username].nil?
      username_string = params[:username].to_s
      final_username = User.where("users.username LIKE '%#{username_string}%'").limit(1)
      render json: final_username 
    else 
      render json: User.all 
    end
  end 

  #localhost:3000/users?user[name]=bob&user[email]=bob@email.com
  #Sample POST request 
  def create
    user = User.new(user_params)
    # replace the `user_attributes_here` with the actual attribute keys
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    render json: User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    	if user.update(user_params)   
        # USE DOUBLE QUOTES   VVVVVVV
		    redirect_to "/users/#{user.id}"
	    else
		    render json: user.errors.full_messages, status: 422
	    end
  end

  def destroy
    users = User.find(params[:id])
    User.find(params[:id]).destroy 
    render json: users 

  end

  private
  def user_params
	  params.require(:user).permit(:username) 
  end

end
