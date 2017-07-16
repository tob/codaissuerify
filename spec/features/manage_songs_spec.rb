require 'rails_helper'

feature 'CRUD songs', js: true do
  let(:artist) { create(:artist)}
  let(:artist) { create(:song)}

  scenario 'add a new song' do
    visit artist_path(artist.id)
    fill_in 'new-song', with: 'Rock around the clock via testing'

    # sleep(1)
    page.execute_script("$('form').submit()")

    # sleep(1)
    expect(page).to have_content('Rock around the clock via testing')
  end

  scenario 'delete single song' do
    visit artist_path(artist.id)
    fill_in 'new-song', with: 'delete_this_song'
    page.execute_script("$('form').submit()")

    # allows page to reload
    sleep 1

    find('li', text: 'delete_this_song').click_link('Delete')

    expect(page).to have_no_content('delete this song')
  end


  scenario 'delete all songs' do
    visit artist_path(artist.id)
    for  song in 0..3
      fill_in 'new-song', with: 'Same old song'
      page.execute_script("$('form').submit()")
      sleep 1
    end

    click_button('clean-up')
    expect(page).to have_no_css('.song')
  end

end
