post '/post/:post_id/comments' do
  @comment = Comment.create(user_id: session[:user_id], content: params[:content], post_id: params[:post_id])
  redirect back
end

get '/comments/:id/edit' do
  p params
  @comment = Comment.find(params[:id])
  erb :'comments/edit'
end

put '/comments/:id' do
  @comment = Comment.update(params[:id], :content => params[:content])
  redirect "/posts/#{@comment.post.id}"
end

delete '/comments/:id' do
  @comment = Comment.find(params[:id])
  if @comment.user.id == current_user.id
    Comment.delete(params[:id])
  else
    redirect "/posts/#{@comment.post.id}?error=no_permission"
  end
  redirect "/posts/#{@comment.post.id}"
end