get '/posts/:id' do
  @post = Post.find(params[:id])
  erb :'posts/posts'
end

post '/posts/new' do
  if current_user
    @posts = Post.create(user_id: current_user.id, title: params[:title], content: params[:content])
  else
    redirect '/'
  end
  redirect back
end

get '/posts/:id/edit' do
  @post = Post.find(params[:id])
  erb :'posts/edit'
end

put '/posts/:id' do
  @post = Post.update(params[:id], :title => params[:title], :content => params[:content])
  redirect '/welcome'
end

delete '/posts/:id' do
  @post = Post.find(params[:id])
  if @post.user.id == current_user.id
    Post.delete(params[:id])
  else
    redirect '/welcome?error=no_permission'
  end
  redirect '/welcome'
end