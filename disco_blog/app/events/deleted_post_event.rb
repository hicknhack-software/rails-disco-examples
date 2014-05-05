class DeletedPostEvent
  include ActiveEvent::EventType
  attributes :id
end
