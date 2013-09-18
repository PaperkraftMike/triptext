namespace :messages do

task :check_messages => :environment do
  Message.where("dispatch_on" == (Time.now - 300)).each do |t|
    require 'twilio-ruby'
    @twilio_sid = ENV['TWILIO_ACCOUNT_SID']
    @twilio_auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new(@twilio_sid.to_s.strip, @twilio_auth_token.to_s.strip)
      @client.account.sms.messages.create(
        :from => ENV['TWILIO_NUMBER'],
        :to => "#{Number.find(t.number_id).phone_number}",
        :body => "I'll be there in five minutes."
      )

  end
 end
end
