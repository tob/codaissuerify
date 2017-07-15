require 'rails_helper'

feature 'Manage songs', js: true do
      let(:artist) { create(:artist)}
  scenario 'add a new song' do
    # Point your browser towards the todo path
    visit artist_path(artist.id)

    # Enter description in the text field
    fill_in 'new-song', with: 'Rock around the clock via testing'

    # Press enter (to submit the form)
    page.execute_script("$('form').submit()")

    # Expect the new task to be displayed in the list of tasks
    expect(page).to have_content('Rock around the clock via testing')
  end
end
