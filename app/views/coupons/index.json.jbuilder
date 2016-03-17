json.array!(@coupons) do |coupon|
  json.extract! coupon, :id, :price, :airline_id_id
  json.url coupon_url(coupon, format: :json)
end
