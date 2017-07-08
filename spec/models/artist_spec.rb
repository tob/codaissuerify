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

  describe "validations" do
    it "is invalid without a name" do
      artist = Artist.build(name: "")
      artist.valid?
      expect(artist.errors).to have_key(:name)
    end

    it "is invalid without an image_url" do
      artist = artist.build(image_url: nil)
      artist.valid?
      expect(room.errors).to have_key(:image_url)
    end

    it "is invalid with a name longer than 15 characters" do
      artist = Artist.new(listing_name: "Supercalifragilistichespiralidoso")
      artist.valid?
      expect(artist.errors).to have_key(:name)
    end
  end
end
