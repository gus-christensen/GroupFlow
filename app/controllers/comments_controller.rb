# new
get '/comments/new' do
  erb :'comments/new'
end


# create
# im a user who is leaving a comment on an answer
# post '/comments' do
#   Comment.new(
#     commentable_id: ,
#     commentable_type: ,
#     user_id: ,
#     body:
#     )
#   post
#   erb:
# end


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
