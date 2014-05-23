json.array!(@eplayers) do |eplayer|
  json.extract! eplayer, :id
  json.url eplayer_url(eplayer, format: :json)
end
