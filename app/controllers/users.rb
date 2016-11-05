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
    # success
    redirect '/'
  else
    # failure
    status 422
    @errors = user.errors.full_messages
    erb :'users/new'
  end
end

# Log in
get '/sessions/new' do
 # new action
end

post '/sessions' do
  # create session
end

# Log out
delete '/sessions/:id' do
  # delete session
end
