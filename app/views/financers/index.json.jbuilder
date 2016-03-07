json.array!(@financers) do |financer|
  json.extract! financer, :id, :name
  json.url financer_url(financer, format: :json)
end
