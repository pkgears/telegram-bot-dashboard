class Chat
  include Mongoid::Document
  include Mongoid::Timestamps

  field :chat_id, type: Integer
  field :chat_type, type: String
  field :first_name, type: String
  field :title, type: String
end
