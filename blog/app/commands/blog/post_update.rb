module Blog
  class PostUpdate
    include ActiveEvent::Command

    attributes :id, :title, :text
  end
end