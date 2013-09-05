json.array!(@addresses) do |address|
  json.extract! address, :zip_code, :state, :lat_long, :city, :street
  json.url address_url(address, format: :json)
end
