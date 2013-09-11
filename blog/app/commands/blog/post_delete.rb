module Blog
  class PostDelete
    include ActiveEvent::Command

    attributes :id
  end
end