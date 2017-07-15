class Api::SongsController < ApplicationController
  def index
    render status: 200, json: {
      songs: Song.all
    }.to_json
  end
end
