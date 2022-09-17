
require_relative("base")

module Savers
  class Chat < Savers::Base
    attr_accessor :message

    def initialize(message)
      @message = JSON.parse(message)
    end

    def self.call(message)
      new(message).call
    end

    def call
      api_client["/chats"].post(payload)
    end
    
    private

    def payload
      {
        chat: @message["chat"],
        message: {
          text: @message["text"],
          from: @message["from"]["id"],
          first_name: @message["from"]["first_name"],
          last_name: @message["from"]["last_name"]
        }
      }
    end
  end
end
