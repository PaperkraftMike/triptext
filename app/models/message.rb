class Message < ActiveRecord::Base
  attr_accessor :phone_number
  validates :phone_number, :presence => { :message => "You must provide a valid US Cell phone number." }
  validates :drive_time, presence: true

  def create_number
    @message = Message.last
    @number = Number.create(phone_number: phone_number, message_id: @message.id)
    @number.save
  end

  

  has_one :number
  has_one :addresses
end
