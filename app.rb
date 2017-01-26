ENV["RACK_ENV"] ||= "development"
require 'rubygems'
require 'sinatra/base'
require 'data_mapper'
require './models/link'
require './models/tag'



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
    tag=Tag.new(name: params[:tag])
    Link.create(url: params[:url], title: params[:title], tag: tag)
    redirect '/links'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
