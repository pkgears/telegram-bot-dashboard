# frozen_string_literal: true

class Chats::Messages::Component < ViewComponent::Base
  def initialize(message:, same_origin: false)
    @message = message
    @same_origin = same_origin
  end

  def text_align
    @message.bot ? "has-text-left" : "has-text-right"
  end

  def justify_right
    unless @message.bot then "justify-right" end
  end

  def date
    @message.created_at.strftime("%H:%M %d/%m/%Y")
  end

  def from
    return if @same_origin
    
    @message.name
  end
end
