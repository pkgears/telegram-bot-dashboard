class Bots::CheckStatus
  def initialize(bot)
    @bot = bot
  end

  def self.call(bot)
    new(bot).call
  end

  def call
    check_process
  end

  private

  def check_process
    return if @bot.pid.blank?
    return Process.getpgid(@bot.pid) rescue @bot.update(pid: nil)
  end
end