require("telegram/bot")

module Messages
  class Sender

    def self.call(message:, receiver:, token:)
      new(message, receiver, token).call
    end

    def initialize(message, receiver, token)
      @message = message
      @receiver = receiver.to_i
      @token = token
    end

    def call
      send_message
    end

    private 

    def send_message
      Telegram::Bot::Client.run(@token) do |bot|
        bot.api.send_message(chat_id: @receiver, text: @message)
      end
    end
  end
end
