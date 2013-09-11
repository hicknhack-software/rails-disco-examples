module Blog
  class PostDeleted
    include ActiveEvent::EventType

    attributes :id
  end
end