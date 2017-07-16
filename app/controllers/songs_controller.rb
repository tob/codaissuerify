class SongsController < ApplicationController

    


    def create
      set_artist
      @song = @artist.songs.create(song_params)
      if @song.save
        # set_song
        redirect_to artist_path(@artist),  notice: "Song created"

      else
        render :new
      end
    end

    def destroy
      set_artist
      set_song
      if @song.destroy
        redirect_to artist_path(@artist), notice: "Song deleted"
      else
        redirect_to artist_path(@artist), notice: "Something went wrong"
      end
    end

    private
    def set_song
        @song = Song.find(params[:id])
    end

    def set_artist
      @artist = Artist.find(params[:artist_id])
    end

    def song_params
      params
        .require(:song)
        .permit(
          :name, :length
        )
    end
  end
