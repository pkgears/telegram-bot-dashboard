class Message
  include Mongoid::Document
  include Mongoid::Timestamps

  field :text, type: String

  embedded_in :chat
end
