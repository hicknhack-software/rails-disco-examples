class PostProjection
  include ActiveProjection::ProjectionType

  def deleted_post_event(event)
    Post.find(event.id).destroy!
  end

  def updated_post_event(event)
    Post.find(event.id).update! event.values
  end

  def created_post_event(event)
    Post.create! event.to_hash
  end
  
end
