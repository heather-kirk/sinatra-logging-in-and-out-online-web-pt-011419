require_relative '../../config/environment'
class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end

  post '/login' do
  @user = User.find(params[:id])
  session[:user_id] = @user.id
  if @user
    redirect to "/account"
    erb :account
  else 
    erb :error 
    end 
  end

  get '/account' do
     
  end

  get '/logout' do
     session.clear
     redirect to '/'
  end


end

