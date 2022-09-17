class Chats::Dispatcher
  attr_accessor :chat_params, :message_params

  def initialize(chat_params, message_params)
    @chat_params = chat_params
    @message_params = message_params
  end

  def call
    @chat = Chats::Creator.call(@chat_params)
    @message = create_message

    @chat
  end

  def self.call(chat_params, message_params)
    self.new(chat_params, message_params).call
  end

  private 

  def create_message
    return unless @chat.errors.empty?

    Messages::Creator.call(@chat, @message_params)
  end

  def respond_message

  end
end
