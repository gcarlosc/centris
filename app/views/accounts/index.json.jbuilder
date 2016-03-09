json.array!(@accounts) do |account|
  json.extract! account, :id, :organization_name, :web, :subdomain
  json.url account_url(account, format: :json)
end
