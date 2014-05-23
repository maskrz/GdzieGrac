json.array!(@players) do |player|
  json.extract! player, :id, :name, :surname, :address, :latitude, :longitude
  json.url player_url(player, format: :json)
end
