class CommentsController < ApplicationController

  def index
    if !params[:user_id].nil?
      comments = Comment.where(user_id: params[:user_id])
    elsif !params[:artwork_id].nil?
      comments = Comment.where(artwork_id: params[:artwork_id])
    else
      render json: "Must specify artist_id or artwork_id!"
      return
    end
    render json: comments 
  end 

  def create
    comment = Comment.new(comment_params)

    if comment.save
      render json: comment 
    else
      render json: comment.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    Comment.find(params[:id]).destroy 
    render json: comment
  end

  private
  def comment_params
	  params.require(:comment).permit(:user_id, :artwork_id, :body)
  end

end
