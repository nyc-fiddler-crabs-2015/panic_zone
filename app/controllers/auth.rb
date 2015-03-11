get '/login' do
  erb :'auth/login'
end

post '/login' do
  user = User.find_by(name: params[:name])

  if user.try(:authenticate, params[:password])
    session[:user_id] = user.id
    redirect '/welcome'
  else
    redirect '/login'
  end
end

get '/signup' do
  erb :'auth/signup'
end

post '/signup' do
  user = User.create(params[:user])

  if user.save
    session[:user_id] = user.id
    redirect "/welcome"
  else
    redirect '/signup'
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect "/"
end