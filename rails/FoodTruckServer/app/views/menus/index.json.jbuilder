json.array!(@menus) do |menu|
  json.extract! menu, :id, :title
  json.url menu_url(menu, format: :json)
end
