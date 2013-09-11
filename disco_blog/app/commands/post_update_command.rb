class PostUpdateCommand
  include ActiveEvent::Command
  attributes :id, :title, :text
end
