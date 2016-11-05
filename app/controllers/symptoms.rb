get '/symptoms' do
  # display list of all symptoms
  # erb :'/symptoms/index'
  @symptoms = current_user.symptoms
  erb :'symptoms/list'
end

get '/symptoms/new' do
  # return an HTML form for creating a new symptom
  @symptom = Symptom.new
  erb :'symptoms/new'
end

post '/symptoms' do
  # create a new symptom
  symptom = Symptom.create(params[:symptom])
  if symptom.valid?
    current_user.symptoms << symptom
    redirect '/symptoms'
  else
    @errors = symptom.errors.full_messages
    erb :'symptoms/new'
  end
end

get '/symptoms/:id' do
  # display a specific symptom
  @symptom = Symptom.find(params[:id])
  erb :'symptoms/show'
end

get '/symptoms/:id/edit' do
  # return an HTML form for editing a symptom
  @symptom = Symptom.find(params[:id])
  erb :'symptoms/edit'
end

put '/symptoms/:id' do
  # update a specific symptom
end

delete '/symptoms/:id' do
  # delete a specific symptom
end
