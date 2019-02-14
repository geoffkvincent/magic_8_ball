require 'pry'
require 'colorize'

class Magic8
  ANSWERS = [
    "It is certain.".colorize(:green),
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

  ORG_ANSWERS = ANSWERS.clone

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
    puts "What would you wish to do?"
    puts "1) Ask A Question"
    puts "2) Add An Answer"
    puts "3) Answer Reset"
    puts "4) Print All Answers"
    puts "5) Exit"
    @user_input = gets.to_i
    menu_choice
  end

  def menu_choice
    case @user_input
    when 1
      question
    when 2
      add_answer
    when 3
      answer_reset
    when 4
      show_answers
    when 5
      puts "Goodbye"
      exit
    else
      puts "invalid input".colorize(:red)
      menu
    end
  end

  def question
    puts "Ask Me A Question"
    question = gets.strip
    puts '.......shaking'
    puts ANSWERS.sample
  end

  def add_answer
    puts "What Answer Do You Wish To Add?"
    @user_answer = gets.strip
    ANSWERS.push @user_answer
    menu
    # ANSWERS.each do |answer|
    #   if answer != @user_answer
    #     ANSWERS.push @user_answer
    #     puts "Your Answers Been Added"
    #   else
    #     puts "Answer Already Exists"
    #   end
    # end
  end

  def show_answers
    puts ANSWERS
    menu
  end

end

magic = Magic8.new
magic.greeting







