json.array!(@public_keys) do |public_key|
  json.extract! public_key, :id
  json.url public_key_url(public_key, format: :json)
end
