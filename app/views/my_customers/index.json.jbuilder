json.array!(@my_customers) do |my_customer|
  json.extract! my_customer, :id, :number, :tradeable_id, :tradeable_type
  json.url my_customer_url(my_customer, format: :json)
end
