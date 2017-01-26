require 'spec_helper'

feature 'Multiple tags' do 
	scenario 'I want to add multiple tags to a link url and title' do
      visit ('/new')
      fill_in('title', with: 'BBC news')
      fill_in('url', with: 'http://www.bbc.co.uk/news')
      fill_in('tags', with:'tomato news uk')
      click_button('Submit')
      link = Link.first
      expect(link.tags.map(&:name)).to include('tomato')
      expect(link.tags.map(&:name)).to include('news')
    end
	end
