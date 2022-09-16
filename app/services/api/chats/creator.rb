class Api::Chats::Creator
  attr_accessor :chat_id, :chat_type, :name

  def initialize(params = {})
    @params = params
    @chat_id = params.dig(:id)&.to_i
    @chat_type = params.dig(:type)
    @name = @params.dig(:title) || @params.dig(:first_name)
    @message = @params.dig(:text)
  end

  def call
    @chat = find_or_create_chat
    create_message

    @chat
  end

  def self.call(params)
    self.new(params).call
  end

  private 

  def chat_params
    {
      chat_id: @chat_id,
      chat_type: @chat_type,
      name: @name
    }
  end

  def find_or_create_chat
    Chat.where(chat_id: chat_id).first_or_create(chat_params)
  end

  def create_message
    return unless @chat.errors.empty?

    Messages::Saver.call(@chat, @message)
  end
end
