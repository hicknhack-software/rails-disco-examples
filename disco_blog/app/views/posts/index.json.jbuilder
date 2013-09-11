json.array!(@posts) do |post|
  json.extract! post, :title, :text
  json.url post_url(post, format: :json)
end
