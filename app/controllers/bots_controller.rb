class BotsController < ApplicationController
  before_action :set_bot, only: %i[ show edit update destroy send_message]

  # GET /bots
  def index
    @bots = Bot.all
  end

  # GET /bots/1
  def show
  end

  # GET /bots/new
  def new
    @bot = Bot.new
  end

  # GET /bots/1/edit
  def edit
  end

  # POST /bots
  def create
    @bot = Bot.new(bot_params)

    if @bot.save
      redirect_to bot_url(@bot), notice: "Bot was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bots/1
  def update
    if @bot.update(bot_params)
      redirect_to bot_url(@bot), notice: "Bot was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /bots/
  def destroy
    @bot.destroy

    redirect_to bots_url, notice: "Bot was successfully destroyed.", status: :see_other
  end

  def send_message
    Messages::Sender.call(bot: @bot, message_params: message_params)
    redirect_to @bot, notice: "Mensaje enviado correctamente"
  # rescue ::Telegram::Bot::Exceptions::ResponseError => e
  #   redirect_to @bot, alert: e
  rescue StandardError => e
    redirect_to @bot, alert: "Ocurrio un error al intentar enviar el mensaje. #{e}"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bot
      @bot = Bot.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bot_params
      params.require(:bot).permit(:name, :username, :token)
    end

    def message_params
      params.permit(:text, :receiver)
    end
end
