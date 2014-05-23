json.array!(@fields) do |field|
  json.extract! field, :id, :name, :address, :description, :number_of_baskets, :latitude, :longitude
  json.url field_url(field, format: :json)
end
