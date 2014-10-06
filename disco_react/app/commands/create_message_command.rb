class CreateMessageCommand
  include ActiveModel::Model
  include ActiveEvent::Command
  form_name 'Message'
  attributes :head, :body, :author, :email
end
