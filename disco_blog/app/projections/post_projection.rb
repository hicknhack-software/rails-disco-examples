
class PostProjection
  include ActiveProjection::ProjectionType

    def Post_delete_event(event)
      Post.find(event.id).destroy!
    end

    def Post_update_event(event)
      Post.find(event.id).update! event.values
    end

    def Post_create_event(event)
      Post.create! event.values.merge(id: event.id)
    end
end

