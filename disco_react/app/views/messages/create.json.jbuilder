event_id = read_and_clear_event_id
json.event_url event_source_path(projection: 'MessageProjection', event: event_id) if event_id
json.message do
  json.set! :id, event_id
  json.extract! @message, :head, :body, :author, :email
end
