require("telegram/bot")

module Messages
  class Sender

    def initialize(bot, message_params)
      @bot = bot
      @receiver = message_params[:receiver]
      @text = message_params[:text]
    end

    def self.call(bot:, message_params:)
      new(bot, message_params).call
    end

    def call
      send_message
      create_message
    end

    private 

    def send_message
      Telegram::Bot::Client.run(@bot.token) do |bot|
        bot.api.send_message(chat_id: @receiver, text: @text)
      end
    end

    def create_message
      params = {
        text: @text,
        first_name: @bot.username,
        bot: true
      }

      Messages::Creator.call(chat, params)
    end

    def chat
      @chat = Chat.find_by(chat_id: @receiver)
    end
  end
end
