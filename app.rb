require 'pg'
require 'sinatra'
require 'sinatra/reloader'
require 'pry'

configure do
  set :views, 'app/views'
end

Dir[File.join(File.dirname(__FILE__), 'app', '**', '*.rb')].each do |file|
  require file
  also_reload file
end

get '/' do
  @todos = Todo.all

  erb :index
end

post '/todos' do
  todo = Todo.new(params[:todo])
  todo.save

  redirect '/'
end
