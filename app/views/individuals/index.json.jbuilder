json.array!(@individuals) do |individual|
  json.extract! individual, :id, :first_name, :last_name
  json.url individual_url(individual, format: :json)
end
