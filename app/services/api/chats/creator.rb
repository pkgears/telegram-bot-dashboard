class Api::Chats::Creator
  attr_accessor :chat_id, :chat_type, :name

  def initialize(params = {})
    @params = params
    @chat_id = params.dig(:chat_id)
    @chat_type = params.dig(:chat_type)
    @name = @params.dig(:title) || @params.dig(:first_name)
  end

  def call
    Chat.create(chat_params)
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
end
