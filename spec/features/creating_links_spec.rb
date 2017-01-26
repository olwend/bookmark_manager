# As a user
# So that I can save time in visiting sites I regularly visit
# I want to be able to add links

require 'spec_helper'

feature 'creating links' do

    scenario 'I want to enter add links page' do
      visit ('/')
      expect(page).to have_content('Add new link')
    end

    scenario 'I want to add a link url and title' do
      visit ('/new')
      fill_in('title', with: 'BBC news')
      fill_in('url', with: 'http://www.bbc.co.uk/news')
      click_button('Submit')
      within 'ul#links' do
        expect(page).to have_content('BBC')
      end
    end

end
