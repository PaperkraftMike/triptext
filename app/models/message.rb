class Message < ActiveRecord::Base
  attr_accessor :phone_number, :drive_time


  
  def create_number
    if phone_number.present?
      @number = Number.new(:phone_number => phone_number)
      @number.save && @number.messages << Message.last
    end
  end

  def create_dispatch
   if drive_time.present?
      @message = Message.where(phone_number: phone_number);
      @message.dispath_on = (DateTime.now + drive_time.value);
      @message.save
    end
  end

  
  has_one :number
  has_one :addresses
  belongs_to :user
end
