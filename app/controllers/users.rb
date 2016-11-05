# Register
get '/users/new' do
  # generate form for user registration
  @user = User.new
  erb :'users/new'
end

post '/users' do
  # submit new user form and create user
  user = User.create(params[:user])
  if user.valid?
    session[:user_id] = user.id
    redirect '/'
  else
    status 422
    @errors = user.errors.full_messages
    erb :'users/new'
  end
end

# Log in
get '/sessions/new' do
 # new action
 erb :'sessions/new'
end

post '/sessions' do
  # create session
  user = User.authenticate(params[:user][:username], params[:user][:password])
  if user
    session[:user_id] = user.id
    p session
    redirect '/'
  else
    status 422
    @errors = ["Login failed"]
    erb :'sessions/new'
  end
end

# Log out
delete '/logout' do
  # delete session
  session.delete(:user_id)
  redirect '/'
end
