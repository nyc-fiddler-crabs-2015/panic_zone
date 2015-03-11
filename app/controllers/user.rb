get '/users.json' do
  return User.all.to_json
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :'users/profile'
end

