json.array!(@trucks) do |truck|
  json.extract! truck, :id, :lng, :lat, :name
  json.url truck_url(truck, format: :json)
end
