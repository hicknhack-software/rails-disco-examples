class MessagesController < ApplicationController
  include EventSource

  respond_to :html, :json

  def index
    @messages = Message.all
  end

  def show
    @message = Message.find(id_param)
  end

  def new
    @message = CreateMessageCommand.new
  end

  def edit
    @message = UpdateMessageCommand.new Message.find(id_param).attributes
  end

  def create
    @message = CreateMessageCommand.new message_params
    flash[:notice] = 'Message was successfully created.' if store_event_id Domain.run_command(@message)
    respond_with @message, location: messages_url
  end

  def update
    @message = UpdateMessageCommand.new message_params.merge(id: id_param)
    if store_event_id Domain.run_command(@message)
      redirect_to @message, notice: 'Message was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    delete_message = DeleteMessageCommand.new(id: id_param)
    if store_event_id Domain.run_command(delete_message)
      redirect_to messages_url, notice: 'Message was successfully destroyed.'
    else
      redirect_to message_url(id: id_param), alert: 'Message could not be deleted.'
    end
  end

  private

  def message_params
    params.require(:message).permit(:head, :body, :author, :email)
  end

  def id_param
    params.require(:id).to_i
  end
end
