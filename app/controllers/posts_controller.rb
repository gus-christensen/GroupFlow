get '/posts' do
  @posts = Post.all
  erb :'posts/index'
end

get '/posts/new' do
  erb :'posts/new'
end

post '/posts' do
  @post = current_user.posts.new(params[:post])
  if @post.save
    redirect '/posts'
  else
    erb :'posts/new'
  end
end
