require 'twilio-ruby'
require 'sinatra'


@client = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN

@client.account.messages.create(
    from: '+12062021955',
    to: '+13103652965',
    body: 'Hide yo keys.'
  )

post '/sms' do
  puts "Message #{params['Body']}!"

  twiml = Twilio::TwiML::Response.new do |r|
    r.Message "Added to our list of robot sightings! Head for the hills!"
  end
  twiml.txt
end
