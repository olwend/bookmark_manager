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
    p @links = Link.all
    erb :'links/index'
  end

  post '/links' do
    link = Link.new(url: params[:url],     # 1. Create a link
                  title: params[:title])
    array = params[:tags].split(" ")
    array.each do |tag|
    link.tags << Tag.first_or_create(name: tag)
      end
    link.save                              # 4. Saving the link.
    redirect to('/links')
  end

  get '/tags/:name' do
    tag = Tag.all(name: params[:name])
    p tag
    @links = tag ? tag.links : []
    p tag.links
    erb :'links/index'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
