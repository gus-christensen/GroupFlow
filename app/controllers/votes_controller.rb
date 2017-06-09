post '/votes' do
  @post = Post.find_by(id: params[:post])
  @vote = Vote.new(value: params[:value], voteable: @post )
  @vote.save
  redirect '/'
end

post '/votes/comments' do
  @comment = Comment.find_by(id: params)
  @vote = Vote.new(value: params[:value], voteable: @comment)
  @vote.save
  redirect '/'
end
