event_id = read_and_clear_event_id
json.event_url event_source_path(projection: 'MessageProjection', event: event_id) if event_id
json.messages(@messages) do |message|
  json.extract! message, :id, :head, :body, :author, :email
  json.url message_url(message, format: :json)
end
