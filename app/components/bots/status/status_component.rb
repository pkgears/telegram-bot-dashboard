# frozen_string_literal: true

class Bots::Status::StatusComponent < ViewComponent::Base
  def initialize(pid: nil)
    @pid = pid
  end

  def status
    @pid.present? ? "online" : "offline"
  end
end
