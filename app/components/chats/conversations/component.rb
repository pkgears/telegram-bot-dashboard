# frozen_string_literal: true

class Chats::Conversations::Component < ViewComponent::Base
  def initialize(chat:)
    @chat = chat
  end

  def same_origin(prev_message, current_message)
    return false if prev_message == @chat.messages.last

    prev_message.from == current_message.from
  end
end
