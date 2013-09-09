class Message < ActiveRecord::Base
  attr_accessor :phone_number

  require 'twilio-ruby'


  def send_text
    @message = Message.last
    @twilio_sid = ENV['TWILIO_ACCOUNT_SID']
    @twilio_auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new(@twilio_sid.to_s.strip, @twilio_auth_token.to_s.strip)
      @client.account.sms.messages.create(
        :from => ENV['TWILIO_NUMBER'],
        :to => Number.find(@message.number_id).phone_number,
        :body => @message.text
      )
  end

  def create_number
    @message = Message.last
    if phone_number.present?
      @number = Number.new(:phone_number => phone_number)
      @number.save
      @number.messages << @message
    end
  end
  
  has_one :number
  belongs_to :user
end
