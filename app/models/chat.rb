class Chat
  include Mongoid::Document
  include Mongoid::Timestamps

  field :chat_id, type: Integer
  field :chat_type, type: String
  field :name, type: String

  embeds_many :messages

  validates_uniqueness_of :chat_id
  validates_presence_of :chat_id, :chat_type
end
