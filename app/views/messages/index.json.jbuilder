json.array!(@messages) do |message|
  json.extract! message, :category, :dispatch_on, :ip_address, :text, :user_id, :number_id, :address_id
  json.url message_url(message, format: :json)
end
