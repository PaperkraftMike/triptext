json.array!(@locations) do |location|
  json.extract! location, :zip_code, :lat_long, :street, :latitude, :longitude, :gmaps
  json.url location_url(location, format: :json)
end
