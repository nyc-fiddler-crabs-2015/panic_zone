get '/' do
  # @error = params[:error]
  erb :index
end

get '/welcome' do
  @posts = Post.all
  erb :'posts/welcome'
end