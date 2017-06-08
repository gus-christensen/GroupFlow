get '/' do
  @posts = Post.all
  erb :'/post/index'
end
