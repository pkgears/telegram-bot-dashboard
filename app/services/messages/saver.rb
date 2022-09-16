module Messages
  class Saver

    attr_accessor :chat, :text

    def initialize(chat, text = "* Empty message *")
      @chat = chat
      @text = text
    end

    def self.call(chat, text)
      new(chat, text).call
    end

    def call
      @chat.messages.create(text: text)
    end

  end
end
