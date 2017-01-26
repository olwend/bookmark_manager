require 'spec_helper'

feature 'Welcome' do
	scenario 'to have welcome message and email address' do
		visit('/sign_up')
		
	end
end