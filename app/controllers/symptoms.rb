get '/symptoms' do
  # display list of all symptoms
  # erb :'/symptoms/index'
end

get '/symptoms/new' do
  # return an HTML form for creating a new symptom
  # erb :'/symptoms/new'
end

post '/symptoms' do
  # create a new symptom
end

get '/symptoms/:id' do
  # display a specific symptom
  # erb :'/symptoms/show'
end

get '/symptoms/:id/edit' do
  # return an HTML form for editing a symptom
  # erb :'/symptoms/edit'
end

put '/symptoms/:id' do
  # update a specific symptom
end

delete '/symptoms/:id' do
  # delete a specific symptom
end
