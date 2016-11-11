get '/symptoms' do
  # display list of all symptoms
  # erb :'/symptoms/index'
  @symptoms = current_user.symptoms
  if request.xhr?
  erb :'symptoms/_list', layout: false, locals: {symptoms: @symptoms }
  else
    erb :'symptoms/_list'
  end
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
  if request.xhr?
    erb :'symptoms/show', layout: false, locals: {symptom: @symptom }
  else
    erb :'symptoms/show'
  end
end

get '/symptoms/:id/edit' do
  # return an HTML form for editing a symptom
  @symptom = Symptom.find(params[:id])
  if request.xhr?
    erb :'symptoms/edit', layout: false, locals: {symptom: @symptom}
  else
    erb :'symptoms/edit'
  end
end

put '/symptoms/:id' do
  # update a specific symptom
  symptom = Symptom.find(params[:id])
  symptom.update(params[:symptom])
  @symptoms = current_user.symptoms
  if request.xhr?
    erb :'symptoms/_list', layout: false, locals: {symptoms: @symptoms }
  else
    erb :'symptoms/_list'
  end
end

delete '/symptoms/:id' do
  # delete a specific symptom
  symptom = Symptom.find(params[:id])
  symptom.destroy
  @symptoms = current_user.symptoms
  if request.xhr?
    erb :'symptoms/_list', layout: false, locals: {symptoms: @symptoms }
  else
    redirect '/'
  end
end
