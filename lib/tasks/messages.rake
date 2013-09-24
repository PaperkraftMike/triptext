namespace :messages do

task :check_messages => :environment do
  Message.find_each do |t|
      if t.confirmation.nil? && !t.dispatch_on.nil?
        if t.dispatch_on - 5.minutes <= DateTime.now
          require 'twilio-ruby'
          @twilio_sid = TWILIO_ACCOUNT_SID
          @twilio_auth_token = TWILIO_AUTH_TOKEN
          @client = Twilio::REST::Client.new(@twilio_sid.to_s.strip, @twilio_auth_token.to_s.strip)
            @client.account.sms.messages.create(
              :from => TWILIO_NUMBER,
              :to => "#{Number.find(t.number).phone_number}",
              :body => "I'm just around the corner. I'll be there soon."
            )
          t.confirmation = true
          t.save
          $number += 1 
          end
        end
      end
    end
 end



