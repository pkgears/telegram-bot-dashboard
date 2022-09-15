class Chat
  include Mongoid::Document
  include Mongoid::Timestamps

  field :chat_id, type: Integer
  field :chat_type, type: String
  field :name, type: String

  validates_uniqueness_of :chat_id
end
