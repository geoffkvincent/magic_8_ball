require 'pry'
require 'colorize'

class Magic8

  ANSWERS = [
    "It is certain.".colorize(:blue),
    "It is decidedly so.".colorize(:green),
    "Without a doubt.".colorize(:green),
    "Yes - definitely.".colorize(:green),
    "You may rely on it.".colorize(:green),
    "As I see it, yes.".colorize(:green),
    "Most likely.".colorize(:green),
    "Outlook good.".colorize(:green),
    "Yes.".colorize(:green),
    "Signs point to yes.".colorize(:green),
    "Reply hazy, try again.".colorize(:yellow),
    "Ask again later.".colorize(:yellow),
    "Better not tell you now.".colorize(:yellow),
    "Cannot predict now.".colorize(:yellow),
    "Concentrate and ask again.".colorize(:yellow),
    "Don't count on it.".colorize(:red),
    "My reply is no.".colorize(:red),
    "My sources say no.".colorize(:red),
    "Outlook not so good.".colorize(:red),
    "Very doubtful.".colorize(:red)
  ]

  def greeting
    puts ""
    puts ""
    puts '    Welcome to Magic 8 Ball'.colorize(:yellow)
    puts "--------------------------------".colorize(:yellow)
    puts "88888888888888888888888888888888".colorize(:green)
    puts "--------------------------------".colorize(:yellow)
    menu
  end

  def menu
    puts "Ask Me A Question"
    question = gets.strip
    puts '.......shaking'
    puts ANSWERS.sample
  end
end

magic = Magic8.new
magic.greeting