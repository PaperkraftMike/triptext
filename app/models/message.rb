class Message < ActiveRecord::Base
  attr_accessor :phone_number, :drive_time
  validates :phone_number, :presence => { :message => "You must provide a valid US Cell phone number." }
  validates :drive_time, presence: true

  def create_number(id)
    logger.info id
    message = Message.find(id)
    @number = Number.create(phone_number: phone_number, message_id: id)
    @number.save
    message.dispatch_on = message.created_at
    message.dispatch_on += drive_time.to_i
  end

  has_one :number
  has_one :addresses
end