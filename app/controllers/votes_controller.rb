post '/votes' do
  @post = Post.find_by(id: params[:post])
  @vote = Vote.new(value: params[:value], voteable: @post, user_id: current_user.id )
  @found_vote = Vote.find_by(voteable_id: @post.id, user_id: current_user.id)
  if !!@found_vote
    if @found_vote.value != @vote.value
      @found_vote.destroy
      @vote.save
    end
  else
    @vote.save
  end
  redirect '/'
end

post '/votes/answers/:post_id' do
  @answer = Answer.find_by(id: params[:answer])
  @vote = Vote.new(value: params[:value], voteable: @answer)
  @vote.save
  redirect "/posts/#{params[:post_id]}"
end
