json.array!(@passengers) do |passenger|
  json.extract! passenger, :id, :name, :email, :phone, :address
  json.url passenger_url(passenger, format: :json)
end
