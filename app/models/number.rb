class Number < ActiveRecord::Base
  belongs_to :message, :foreign_key => 'message_id'
  validates :phone_number, presence: true
end