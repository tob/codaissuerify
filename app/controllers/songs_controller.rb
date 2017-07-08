class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update]

    def index
      @songs = current_artist.songs
    end

    def new
      @song = current_artist.songs.build
    end

    def create
      @song = current_artist.songs.build(song_params)

      if @song.save
        redirect_to @song, notice: "Song created"
      else
        render :new
      end
    end

    private

    def set_song
      @song = song.find(params[:id])
    end

    def song_params
      params
        .require(:song)
        .permit(
          :name, :length, :artist
        )
    end
  end
