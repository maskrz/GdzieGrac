json.array!(@aths) do |ath|
  json.extract! ath, :id, :name
  json.url ath_url(ath, format: :json)
end
