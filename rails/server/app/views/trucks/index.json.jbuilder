json.array!(@trucks) do |truck|
  json.extract! truck, :id, :lng, :lat, :name, :menu_id
  json.url truck_url(truck, format: :json)
end
