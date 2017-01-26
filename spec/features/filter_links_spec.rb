# As a time-pressed user
# So that I can quickly find links on a particular topic
# I would like to filter links by tag

require 'spec_helper'

feature 'filtering tags' do

    before(:each) do
      Link.create(url: 'http://www.bubblegame.org', title: 'Frothy',
      tags: [Tag.first_or_create(name: 'bubbles')])
      Link.create(url: 'http://www.bubblezone.org', title: 'Ball Zone',
      tags: [Tag.first_or_create(name: 'bubbles')])
      Link.create(url: 'http://www.trouble.com', title: 'Trouble',
      tags: [Tag.first_or_create(name: 'trouble')])
      p link = Link.all
    end

  scenario 'test set up has created chosen tag links' do
    expect(Link.all.tags.map(&:name)).to include('bubbles')
  end

  scenario 'should take me to a page showing only chosen tag links' do
    p Tag.all
    visit ('/tags/bubbles')
    expect(page.status_code).to eq(200)
    expect(page).to have_content('Frothy')
    expect(page).to have_content('Ball Zone')
    expect(page).to_not have_content('Trouble')
  end
end
