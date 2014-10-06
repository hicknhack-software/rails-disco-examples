class UpdateMessageCommand
  include ActiveModel::Model
  include ActiveEvent::Command
  form_name 'Message'
  attributes :id, :head, :body, :author, :email

  def persisted?; true end
end
