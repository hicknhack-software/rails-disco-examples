module Blog
  class PostUpdated
    include ActiveEvent::EventType

    attributes :id
    attributes :title, :text

    def values
      attributes_except :id
    end
  end
end