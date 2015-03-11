get '/' do
  erb :index
end

get '/welcome' do
  @posts = Post.all
  @error = params[:error]
  erb :'posts/welcome'
end