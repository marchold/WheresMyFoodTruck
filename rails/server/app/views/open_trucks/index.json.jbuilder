json.array!(@open_trucks) do |open_truck|
  json.extract! open_truck, :id, :truck_id, :openUntil
  json.url open_truck_url(open_truck, format: :json)
end
