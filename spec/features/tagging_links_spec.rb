#I want to add a tag to links

require 'spec_helper'

feature 'creating tags' do

    scenario 'I want to add a single tag to a link url and title' do
      visit ('/')
      fill_in('title', with: 'BBC news')
      fill_in('url', with: 'http://www.bbc.co.uk/news')
      fill_in('tags', with:'tomato')
      click_button('Submit')
      within 'ul#links' do
        expect(page).to have_content('tomato')
      end
    end


end
