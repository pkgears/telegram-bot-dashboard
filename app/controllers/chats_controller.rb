class ChatsController < ApplicationController
  before_action :set_chat, only: %i[ show edit update destroy ]

  # GET /chats or /chats.json
  def index
    @chats = Chat.all
  end

  # GET /chats/1 or /chats/1.json
  def show
  end

  # GET /chats/new
  def new
    @chat = Chat.new
  end

  # GET /chats/1/edit
  def edit
  end

  # POST /chats or /chats.json
  def create
    @chat = Chat.new(chat_create_params)

    if @chat.save
      redirect_to chat_url(@chat), notice: "Chat was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /chats/1 or /chats/1.json
  def update
    if @chat.update(chat_update_params)
      redirect_to chat_url(@chat), notice: "Chat was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /chats/1 or /chats/1.json
  def destroy
    @chat.destroy

    redirect_to chats_url, notice: "Chat was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chat
      @chat = Chat.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def chat_update_params
      params.require(:chat).permit(:name)
    end

    def chat_create_params
      params.require(:chat).permit(:chat_id, :chat_type, :name)
    end
end
