# coding: UTF-8
require 'telegram/bot'
require 'dotenv/load'



TOKEN = ENV['MyTOKEN']

ANSWERS = [
  #Positive
  "It is certain ",
  "It is decidedly so",
  "Without a doubt ",
  "Yes — definitely",
  "You may rely on it",
  #Indecently positive
  "As I see it, yes",
  "Most likely",
  "Outlook good  ",
  "Signs point to yes",
  "Yes",
  #Neutral
  "Reply hazy, try again ",
  "Ask again later",
  "Better not tell you now ",
  "Cannot predict now ",
  "Concentrate and ask again",
  #Negative
  "Don’t count on it ",
  "My reply is no",
  "My sources say no ",
  "Outlook not so good ",
  "Very doubtful"
]


Telegram::Bot::Client.run(TOKEN) do |bot|
  bot.listen do |message|
    case message.text
    when '/start', '/start start'
      bot.api.send_message(
        chat_id: message.chat.id,
        text: "Hello, #{message.from.first_name}")
    else
      bot.api.send_message(
        chat_id: message.chat.id,
        text: ANSWERS.sample)

    end
  end
end
