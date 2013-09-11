module Blog
  class PostProjection
    include ActiveProjection::ProjectionType

    def post_created(event)
      Post.create! event.values.merge(id: event.id)
    end

    def post_updated(event)
      Post.find(event.id).update! event.values
    end

    def post_deleted(event)
      Post.find(event.id).destroy!
    end
  end
end