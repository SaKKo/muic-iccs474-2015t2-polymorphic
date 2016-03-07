json.array!(@companies) do |company|
  json.extract! company, :id, :tax_number, :name
  json.url company_url(company, format: :json)
end
