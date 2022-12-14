class Chats::Creator
  attr_accessor :chat_id, :chat_type, :name

  def initialize(params = {})
    @chat_id = params.dig(:id)&.to_i
    @chat_type = params.dig(:type)
    @name = find_name(params)
  end

  def call
    Chat.where(chat_id: @chat_id).first_or_create(chat_params)
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

  def find_name(params)
    params.dig(:title) || "#{params.dig(:first_name)} #{params.dig(:last_name)}"
  end
end
