require 'rails_helper'

feature 'CRUD songs', js: true do
  let(:artist) { create(:artist)}
  let(:artist) { create(:song)}

# scenarios = ["add a new song", "delete a song", "delete all songs"]

  scenario 'add a new song' do
    visit artist_path(artist.id)
    fill_in 'new-song', with: 'Rock around the clock via testing'

    # sleep(1)
    page.execute_script("$('form').submit()")

    # sleep(1)
    expect(page).to have_content('Rock around the clock via testing')

    # sleep(3)
  end
  scenario 'delete single song' do
    artist.song.last.destroy
    expect { song.reload }.to raise_error ActiveRecord::RecordNotFound

  end





end
