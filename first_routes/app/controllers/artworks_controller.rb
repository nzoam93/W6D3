class ArtworksController < ApplicationController
    # def index
    #   artworks = Artwork.all
    #   render json: artworks
    # end

    def index
      artworks = Artwork.artworks_for_user_id(params[:user_id])
      render json: artworks
    end

    def create
      artwork = Artwork.new(artwork_params)
      # replace the `user_attributes_here` with the actual attribute keys
    #   artwork.save!
      if artwork.save
        render json: artwork
      else
        render json: artwork.errors.full_messages, status: :unprocessable_entity
      end
    end

    def show
      @artwork = Artwork.find_by(id: params[:id])
      # @artwork = Artwork.find(params[:id])
      render json: @artwork
    end

    def update
      artwork = Artwork.find_by(id: params[:id])
      if artwork.update(artwork_params)
        redirect_to artwork_url(artwork.id)
      else
        render json: artwork.errors.full_messages, status: :unprocessable_entity
      end
    end

    def destroy
      artwork = Artwork.find_by(id: params[:id])
      artwork.destroy
      redirect_to artworks_url #this is plural because it needs the prefix of the index function
    end

    private
    def artwork_params
      params.require(:artwork).permit(:title, :image_url, :artist_id)
    end
  end
