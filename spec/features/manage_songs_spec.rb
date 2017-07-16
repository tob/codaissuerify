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

    sngbfr_del = @artist.songs.length

    find(".clean-this", match: :first).click
    sngaftr_del = artist.songs.length

    expect()


  end

  scenario 'delete all songs' do
    visit artist_path(artist.id)

    click_link('clean-up')
    expect(page).to have_no_css('.song')

  end

end
