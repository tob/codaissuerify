require 'rails_helper'

RSpec.describe Artist, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:image_url) }
    it { is_expected.to validate_length_of(:name).is_at_most(30) }
  end

  describe "associations" do
    it { is_expected.to have_many(:songs) }
  end
end
