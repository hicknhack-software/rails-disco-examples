class CreatedMessageEvent
  include ActiveEvent::EventType
  attributes :id, :head, :body, :author, :email
  def values
    attributes_except :id
  end
end
