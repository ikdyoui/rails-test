json.array!(@hoges) do |hoge|
  json.extract! hoge, :id, :name, :email, :phone, :coffee
  json.url hoge_url(hoge, format: :json)
end
