class CreatePostCommand
  include ActiveModel::Model
  include ActiveEvent::Command
  form_name 'Post'
  attributes :title, :text
end
