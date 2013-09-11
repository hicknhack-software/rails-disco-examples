module Blog
  class PostCreated
    include ActiveEvent::EventType

    attributes :id
    attributes :posted_at
    attributes :title, :text

    def values
      attributes_except :id
    end
  end
end