class Message < ActiveRecord::Base
  attr_accessor :phone_number, :drive_time
  
  def create_number
    if phone_number.present?
      @number = Number.new(:phone_number => phone_number, :message_id => Message.last.id)
      @number.save
    if drive_time.present?
      @message = Message.find(@number.message_id);
      @message.dispatch_on = @message.created_at;
      @message.dispatch_on = @message.dispatch_on + drive_time.to_i
      @message.save
    end
  end
end

  has_one :number
  has_one :addresses
  belongs_to :user
end
