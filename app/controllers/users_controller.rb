get '/' do
  redirect '/posts'
end

get '/users/new' do
  erb :'/users/new'
end

post '/users' do
  @errors = []
  if User.find_by(email: params[:email]) != nil
    @errors << "email already exists"
  end
  if params[:password1] != params[:password2]
    @errors << "passwords didn't match"
  end
  if @errors.length != 0
    erb :'/users/login'
  else
    User.create( {email: params[:email], password: params[:password1] } )
    redirect '/users/login'
  end
end

get '/users/login' do
  erb :'/users/login'
end

post '/users/login' do
  user = User.find_by(email: params[:email])

  if user.authenticate(params[:password])
    session[:message] = "Logged in as #{params[:email]}."
    session[:id] = user.id
    redirect '/'
  else
    @errors = ["authentication failed"]
    erb :login
  end
end

get '/users/logout' do
  session.clear
  redirect '/'
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :'users/show'
end
