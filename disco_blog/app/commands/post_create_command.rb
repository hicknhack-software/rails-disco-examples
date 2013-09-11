class PostCreateCommand
  include ActiveEvent::Command
  attributes :id, :title, :text
end
