class DeletedMessageEvent
  include ActiveEvent::EventType
  attributes :id
end
