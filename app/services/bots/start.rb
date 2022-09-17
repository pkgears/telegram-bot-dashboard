class Bots::Start

  def initialize(bot)
    @bot = bot
  end

  def self.call(bot)
    new(bot).call
  end

  def call
    init_process
  end

  private

  def init_process
    puts "============================="
    pid = fork do
      exec("ruby ./lib/telegram/listener.rb #{@bot.token}")
    end
    Process.detach(pid)
    puts "Starting PID: #{pid}"
    puts "============================="
    @bot.update(pid: pid)
  end
end