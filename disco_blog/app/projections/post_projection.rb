
class PostProjection
  include ActiveProjection::ProjectionType

    def post_delete_event(event)
      Post.find(event.id).destroy!
    end

    def post_update_event(event)
      Post.find(event.id).update! event.values
    end

    def post_create_event(event)
      Post.create! event.values.merge(id: event.id)
    end
end

