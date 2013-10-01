class DispatchMessage
  @queue = :message_queue

  def self.perform(number)
     twilio_sid = ENV['TWILIO_ACCOUNT_SID']
     twilio_auth_token = ENV['TWILIO_AUTH_TOKEN']
     client = Twilio::REST::Client.new(twilio_sid.to_s.strip, twilio_auth_token.to_s.strip)
     client.account.sms.messages.create(
       :from => ENV['TWILIO_NUMBER'],
       :to => "#{number}",
       :body => "I'm just around the corner. I'll be there soon."
     )
  end
end