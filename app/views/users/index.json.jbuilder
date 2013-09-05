json.array!(@users) do |user|
  json.extract! user, :banned
  json.url user_url(user, format: :json)
end
