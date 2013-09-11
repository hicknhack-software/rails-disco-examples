module Blog
  class PostCreate
    include ActiveEvent::Command

    attributes :id, :title, :text
  end
end