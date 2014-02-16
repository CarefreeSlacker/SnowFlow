json.array!(@orders) do |order|
  json.extract! order, :id, :cart_id, :user_id, :country, :region, :post_code, :lane, :home, :appartament, :floor, :personal_payment, :shipped
  json.url order_url(order, format: :json)
end
