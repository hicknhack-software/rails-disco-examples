class MessageProjection
  include ActiveProjection::ProjectionType

  def deleted_message_event(event)
    Message.find(event.id).destroy!
  end

  def updated_message_event(event)
    Message.find(event.id).update! event.values
  end

  def created_message_event(event)
    Message.create! event.to_hash
  end
  
end
