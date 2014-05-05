class UpdatePostCommand
  include ActiveModel::Model
  include ActiveEvent::Command
  form_name 'Post'
  attributes :id, :title, :text

  def persisted?; true end
end
