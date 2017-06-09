# new
get '/comments/new' do
  if request.xhr?
    # binding.pry
    erb :'/comments/_comment_form', layout:false
  else
    erb :'/comments/_comment_form', layout:false
  end
end


# create
# im a user who is leaving a comment on an answer
post '/comments' do
  # binding.pry
  comment = Comment.create(
    body: params[:body],
    user_id: session[:id]
    )

  if comment.save
    erb :'/comments/_comment_show', layout: false, locals: {comment:comment}
  else
    erb :'/comments/_comment_form', layout:false
  end
end


# edit
get '/comments/:id' do
  erb :'comments/edit'
end


# update
put '/comments/:id/edit' do
  comment = comment.find_by(id: params[:id])
  comment.update[params[:body]]
  redirect '/'
end


# delete
delete '/comments/:id' do
  Comment.find_by[id:params[:id]].destroy
  redirect '/'
end
