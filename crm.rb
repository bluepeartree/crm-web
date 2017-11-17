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
  if params[:id] == 'new'
    erb :new
  elsif @contact
    erb :show_contact
  else
    raise Sinatra::NotFound
  end
end

post '/contacts' do
  Contact.create(
    first_name: params[:first_name],
    last_name:  params[:last_name],
    email:      params[:email],
    note:       params[:note]
    )
    redirect to('/contacts')
end

get '/about' do
  erb :about
end

at_exit do
  ActiveRecord::Base.connection.close
end
