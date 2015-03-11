get '/users/:id' do
  @user = User.find(params[:id])
  erb :'users/profile'
end