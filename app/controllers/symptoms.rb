get '/symptoms' do
  # display list of all symptoms
  # erb :'/symptoms/index'
  @symptoms = current_user.symptoms
  erb :'symptoms/_list', layout: false, locals: {symptoms: @symptoms }
end

get '/symptoms/new' do
  # return an HTML form for creating a new symptom
  @symptom = Symptom.new
  erb :'symptoms/new', layout: false, locals: {symptom: @symptom}
end

post '/symptoms' do
  # create a new symptom
  symptom = Symptom.create(params[:symptom])
  if request.xhr? && symptom.valid?
    current_user.symptoms << symptom
    @symptoms = current_user.symptoms
    erb :'symptoms/_list', layout: false, locals: {symptoms: @symptoms }
  elsif symptom.valid?
    current_user.symptoms << symptom
    redirect '/'
  elsif request.xhr? && !symptom.valid?
    @errors = symptom.errors.full_messages
    erb :'symptoms/new', layout: false, locals: {symptom: symptom}
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
  # user = User.find_by(name: 'David')
  # user.update(name: 'Dave')
  symptom = Symptom.find(params[:id])
  symptom.update(params[:symptom])
  redirect '/symptoms'
end

delete '/symptoms/:id' do
  # delete a specific symptom
  symptom = Symptom.find(params[:id])
  symptom.destroy
  redirect '/symptoms'
end
