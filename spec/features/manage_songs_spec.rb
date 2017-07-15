require 'rails_helper'

feature 'Manage songs', js: true do
  let(:artist) { create(:artist)}

scenarios = ["add a new song", "delete a song", "delete all songs"]

  scenario 'add a new song' do
    visit artist_path(artist.id)
    fill_in 'new-song', with: 'Rock around the clock via testing'

    sleep(1)
    page.execute_script("$('form').submit()")

    sleep(1)
    expect(page).to have_content('Rock around the clock via testing')

    sleep(3)


  end

  scenario 'delete all songs' do
    visit artist_path(artist.id)
    #action goes here

    sleep(1)
    page.execute_script("$('form').submit()")

    sleep(1)
    expect(artist.songs.size).to eq(0)

    sleep(3)
  end





end
