require_relative("../savers/chat")

module Responders 
  class Base
    HANDLER_GROUP_ID = -668722729
  
    attr_accessor :message, :bot

    def self.call(bot, message)
      self.new(bot, message).call
    end

    def initialize(bot, message)
      @bot = bot
      @message = message
    end
  
    def call
      begin
        notification
        Savers::Chat.call(message.to_json)
        bot.api.send_message(chat_id: message.chat.id, text: "Hello!")

      rescue RestClient::UnprocessableEntity => error
        bot.api.send_message(chat_id: HANDLER_GROUP_ID, text: error.response.body)
      rescue StandardError => error
        bot.api.send_message(chat_id: HANDLER_GROUP_ID, text: error)
      end
    end

    def notification
      puts message.to_json
      puts "===================================================================="
    end
  
  end
end