require 'rails_helper'

RSpec.describe Artist, type: :model do
  describe Artist do
    describe "#name and photo" do
      it "is composed of name and picture" do
        artist = build(:artist, name: "John Lee Hooker", image_url: "//some_image.jpg")
        expect(artist.name).to eq "John Lee Hooker"
      end
    end
  end
end
