post '/post/:post_id/comments' do
@comment = Comment.create(user_id: session[:user_id], content: params[:content], post_id: params[:post_id])
redirect back
end