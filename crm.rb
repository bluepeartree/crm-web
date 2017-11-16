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

get '/contacts/:id' do
  # instructions for how to handle requests to this route will go here
  @contact = Contact.find_by({id: params[:id].to_i})
  erb :show_contact
end

get '/about' do
  erb :about
end

get '/add' do
  erb :add
end

at_exit do
  ActiveRecord::Base.connection.close
end
