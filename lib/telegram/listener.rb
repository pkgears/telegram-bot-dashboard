require("telegram/bot")
require_relative("./responders/base.rb")

token = ARGV.first
puts "Iniciando Bot!"

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    Responders::Base.call(bot, message)
  end
end