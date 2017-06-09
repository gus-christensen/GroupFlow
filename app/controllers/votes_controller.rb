post '/votes' do
  @post = Post.find_by(id: params[:post])
  @vote = Vote.new(value: params[:value], voteable: @post, user_id: current_user.id )
  @found_vote = Vote.find_by(voteable: @post, user_id: current_user.id)
  if !!@found_vote
    if @found_vote.value != @vote.value
      @found_vote.destroy
      @vote.save
    end
  else
    @vote.save
  end

  if request.xhr? && @vote
    total_votes = Post.find_by(id: params[:post]).total_value_summed
    content_type :json
    {total_votes: total_votes }.to_json
  else
    redirect '/'
  end
end

post '/votes/answers/:post_id' do

  @answer = Answer.find_by(id: params[:answer])
  @vote = Vote.new(value: params[:value], voteable: @answer, user_id: current_user.id)
  @found_vote = Vote.find_by(voteable: @answer, user_id: current_user.id)
  if !!@found_vote
    if @found_vote.value != @vote.value
      @found_vote.destroy
      @vote.save
    end
  else
    @vote.save
  end

  if request.xhr? && @vote
    total_votes = Answer.find_by(id: params[:answer]).total_value_summed
    content_type :json
    {total_votes: total_votes }.to_json
  else
    redirect "/posts/#{params[:post_id]}"
  end


end
