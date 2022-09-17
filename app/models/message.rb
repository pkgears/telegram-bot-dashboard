class Message
  include Mongoid::Document
  include Mongoid::Timestamps

  field :text, type: String
  field :from, type: Integer
  field :first_name, type: String
  field :last_name, type: String
  field :bot, type: Boolean, default: false

  embedded_in :chat
end
