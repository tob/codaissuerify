class ArtistsController < ApplicationController
  def index
    @artist = Artist.all
  end
  def show
     artist
  end
  def destroy
    artist
    if @artist.destroy
      redirect_to artists_path
    else
      redirect_to artists_path
    end
  end

  def artist
     @artist = Artist.find(params[:id])
  end
end
