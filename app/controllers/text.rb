require 'twilio-ruby'
require 'sinatra'


@client = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN

@client.account.messages.create(
    from: '+12062021955',
    to: '+13103652965',
    body: 'Hide your keys.'
  )

# post '/text' do
#   puts "Message #{params['Body']}"

#   # twiml = Twilio::TwiML::Response.new do |r|
#   #   r.Message "Symptom added!"
#   # end
#   # twiml.txt

# end

post '/text' do
  number = params['From']
  body = params['Body']

  content_type 'text/xml'

  "<Response>
    <Message>
      Hello #{number}. You said: #{body}
    </Message>
  </Response>"
end