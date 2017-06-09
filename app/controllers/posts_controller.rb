get '/posts' do
  @posts = Post.all
  erb :'posts/index'
end

get '/posts/new' do
  if logged_in?
    erb :'posts/new'
  else
    redirect '/users/login'
  end
end

post '/posts' do
  @post = current_user.posts.new(params[:post])
  if @post.save
    redirect '/posts'
  else
    erb :'posts/new'
  end
end

get '/posts/:id' do
  @posts = Post.find_by(id:params[:id])
  erb :'posts/show'
end

delete '/posts/:id' do
  Post.find(params[:id]).destroy
  if request.xhr?
    erb :_delete, layout: false
  else
    redirect '/posts'
  end
end

