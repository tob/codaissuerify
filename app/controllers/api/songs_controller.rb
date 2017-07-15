class Api::SongsController < ApplicationController
skip_before_action :verify_authenticity_token

  def index
    render status: 200, json: {
      songs: Song.all
    }.to_json
  end

  def create
    set_artist
    @song = @artist.songs.build(song_params)
    if @song.save
      render status: 201, json: {
        message: "Song added",
        song: @song
      }.to_json
    else
      render status: 422, json: {
        errors: song.errors
      }.to_json
    end
  end

  def destroy
    set_artist
    set_song
    if @song.destroy
      render status: 201, json: {
        message: "Song deleted",
        song: song
      }.to_json
    else
      render status: 422, json: {
        errors: song.errors
      }.to_json
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
