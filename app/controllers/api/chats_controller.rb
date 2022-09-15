class Api::ChatsController < Api::ApplicationController
  before_action :set_chat, only: :show
  # GET /api/chats/1
  # GET /api/chats/1.json
  def show
  end

  # POST /api/chats
  # POST /api/chats.json
  def create
    @chat = Api::Chats::Creator.call(chat_params)

    if @chat.persisted?
      render :show, status: :created, location: @chat
    else
      render json: @chat.errors, status: :unprocessable_entity
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chat
      @chat = Chat.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def chat_params
      params.require(:chat).permit(:chat_id, :chat_type, :title, :first_name)
    end
end
