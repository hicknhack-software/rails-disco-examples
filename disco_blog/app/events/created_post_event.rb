class CreatedPostEvent
  include ActiveEvent::EventType
  attributes :id, :title, :text
  def values
    attributes_except :id
  end
end
