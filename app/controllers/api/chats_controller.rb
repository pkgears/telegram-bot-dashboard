class Api::ChatsController < Api::ApplicationController
  before_action :set_chat, only: :show
  # GET /api/chats/1
  # GET /api/chats/1.json
  def show
  end

  # POST /api/chats
  # POST /api/chats.json
  def create
    @chat = Chats::Dispatcher.call(chat_params, message_params)

    if @chat.errors.empty?
      render :show, status: :created, location: @chat
    else
      render json: @chat.errors, status: :unprocessable_entity
    end
  end


  private
    def set_chat
      @chat = Chat.find(params[:id])
    end

    def chat_params
      params.require(:chat).permit(:id, :type, :title, :first_name, :last_name)
    end

    def message_params
      params.require(:message).permit(:text, :from, :first_name, :last_name)
    end
end
