json.array!(@posts) do |post|
  json.extract! post, :id, :title, :text
  json.url post_url(post, format: :json)
end
