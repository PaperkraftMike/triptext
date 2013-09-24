namespace :messages do

task :check_messages => :environment do
  Message.all.each do |t|
      if t.confirmation.nil? && !t.dispatch_on.nil?
        if t.dispatch_on - 5.minutes <= DateTime.now
          require 'twilio-ruby'
          twilio_sid = ENV['TWILIO_ACCOUNT_SID']
          twilio_auth_token = ENV['TWILIO_AUTH_TOKEN']
          client = Twilio::REST::Client.new(twilio_sid.to_s.strip, twilio_auth_token.to_s.strip)
            client.account.sms.messages.create(
              :from => ENV['TWILIO_NUMBER'],
              :to => "#{Number.find(t.number).phone_number}",
              :body => "I'm just around the corner. I'll be there soon."
            )
          message = Message.find(t.id)
          message.confirmation = true
          message.save
          end
        end
      end
    end
 end



