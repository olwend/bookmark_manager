#I want to add a tag to links

require 'spec_helper'

feature 'creating tags' do

    scenario 'I want to add a single tag to a link url and title' do
      visit ('/new')
      fill_in('title', with: 'BBC news')
      fill_in('url', with: 'http://www.bbc.co.uk/news')
      fill_in('tags', with:'tomato')
      click_button('Submit')
      link = Link.first
      link.tags.map(&:name)
      expect(link.tags.map(&:name)).to include('tomato')
    end


end
