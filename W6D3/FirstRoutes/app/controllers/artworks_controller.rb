class ArtworksController < ApplicationController

  def index
    user = User.find(params[:user_id])
    # ^^^ We get user_id from the nested route 
    artworks = user.artworks.concat(user.shared_artworks)
    render json: artworks 
  end 

  def create
    art = Artwork.new(artwork_params)

    if art.save
      render json: art
    else
      render json: art.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    render json: Artwork.find(params[:id])
  end

  def update
    art = Artwork.find(params[:id])
    	if art.update(artwork_params)   
        # USE DOUBLE QUOTES   VVVVVVV
		    redirect_to "/artworks/#{art.id}"
	    else
		    render json: art.errors.full_messages, status: 422
	    end
  end

  def destroy
    artworks = Artwork.find(params[:id])
    Artwork.find(params[:id]).destroy 
    render json: artworks 

  end

  private
  def artwork_params
	  params.require(:artwork).permit(:title, :image_url, :artist_id)
  end

end
