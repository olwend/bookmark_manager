ENV["RACK_ENV"] ||= "development"
require 'rubygems'
require 'sinatra/base'
require './data_mapper_setup'

class BMM < Sinatra::Base

  get '/new' do
    erb :'links/manage'
  end

  get '/' do
    redirect '/links'
  end

  get '/links' do
    p @link = Link.all
    erb :'links/index'
  end

  post '/links' do
    link = Link.new(url: params[:url],     # 1. Create a link
                  title: params[:title])
    tag  = Tag.first_or_create(name: params[:tags])  # 2. Create a tag for the link
    link.tags << tag                       # 3. Adding the tag to the link's DataMapper collection.
    link.save                              # 4. Saving the link.
    redirect to('/links')
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
