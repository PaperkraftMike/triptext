json.array!(@destinations) do |destination|
  json.extract! destination, :zip_code, :state, :city, :street, :latitude, :longitude
  json.url destination_url(destination, format: :json)
end
