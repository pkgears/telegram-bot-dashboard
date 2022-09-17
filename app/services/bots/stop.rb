class Bots::Stop

  def initialize(bot)
    @bot = bot
  end

  def self.call(bot)
    new(bot).call
  end

  def call
    kill_process
  end

  private

  def kill_process
    puts "============================="
    puts "PID: Killing #{@bot.pid}"
    puts "============================="
    system("kill -9 #{@bot.pid}")
    @bot.update(pid: nil)
  end
end