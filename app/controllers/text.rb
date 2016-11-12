post '/text' do
  twiml = Twilio::TwiML::Response.new do |r|
    puts "Message #{params['Body']}"
    puts "from #{params['From']}"
    r.Message "Added your symptom. To enter more details, visit your symptom log."
  end
  @user = User.find_by(phone: params['From'])
  if @user
    @symptom = Symptom.create(symptom_name: params['Body'])
    @user.symptoms << @symptom
  else
    twiml = Twilio::TwiML::Response.new do |r|
      r.Message "Something went wrong."
    end
  end
  twiml.to_xml
end
