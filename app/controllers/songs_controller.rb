class SongsController < ApplicationController
  before_action :set_artist

      # # start test
      # def create
      #   @song = @artist.songs.build(song_params.merge(:artist params[:artist_id]))
      #
      #   if @song.save
      #      notice: "Song created"
      #   else
      #     render :new
      #   end
      # end
      # #end test

      # start test
      def create
        @song = @artist.songs.build(song_params)

        if @song.save
          redirect_to artist_path(@artist),  notice: "Song created"
        else
          render :new
        end
      end
      #end test

    def destroy
      current_artist.songs.destroy(@song)
    end

    private
    def set_artist
      @artist = Artist.find(params[:artist_id])
    end

    # def set_song
    #    @song = song.find(params[:id])
    #  end

    def song_params
      params
        .require(:song)
        .permit(
          :name, :length
        )
    end
  end
