class MessagesController < ApplicationController
  http_basic_authenticate_with name: Settings::KEYS['BASIC_AUTH_USERNAME'], password: Settings::KEYS['BASIC_AUTH_PASSWORD']
  
  def index
    @messages = Message.list
  end

  def new
    @message = Message.new(params.slice(:to))
  end

  def create
    @message = Message.new(message_params)
    @message.publish

    redirect_to :messages
  end


  private

  def message_params
    params.require(:message).permit(:to, :body)
  end
end
