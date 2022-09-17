module Messages
  class Creator

    attr_accessor :chat, :message_params

    def initialize(chat, message_params)
      @chat = chat
      @message_params = message_params
    end

    def self.call(chat, message_params)
      new(chat, message_params).call
    end

    def call
      @chat.messages.create(message_params)
    end

  end
end
