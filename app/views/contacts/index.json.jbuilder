json.array!(@contacts) do |contact|
  json.extract! contact, :fname, :lname, :address_id, :number_id
  json.url contact_url(contact, format: :json)
end
