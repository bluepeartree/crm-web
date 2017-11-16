require 'sinatra'
require_relative 'contact'

get '/' do
  # erb :index
  redirect to ('/contacts')
end

get '/contacts' do
  @contacts = Contact.all
  erb :contacts
end

get '/about' do
  erb :about
end

at_exit do
  ActiveRecord::Base.connection.close
end
