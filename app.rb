ENV["RACK_ENV"] ||= "development"
require 'rubygems'
require 'sinatra/base'
require './data_mapper_setup'
require './models/user'


class BMM < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/new' do
    erb :'links/manage'
  end

  get '/' do
    redirect '/links'
  end
  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(email: params[:email],
                       password: params[:password])
    session[:user_id] = user.id
    redirect to('/links')
  end

  get '/links' do
    p @links = Link.all
    erb :'links/index'
  end

  post '/links' do
    link = Link.new(url: params[:url],     # 1. Create a link
                  title: params[:title])
    array = params[:tags].split(" ")
    p array
    array.each do |tag|
    link.tags << Tag.first_or_create(name: tag)
    end
    p link.tags
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
