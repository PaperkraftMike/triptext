json.array!(@users) do |user|
  json.extract! user, :first_name, :last_name, :phone_number_id, :contact_id, :banned, :address, :zip_code
  json.url user_url(user, format: :json)
end