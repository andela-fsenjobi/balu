json.array!(@airports) do |airport|
  json.extract! airport, :id, :name, :city_id, :email, :phone
  json.url airport_url(airport, format: :json)
end
