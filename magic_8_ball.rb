require 'pry'
require 'colorize'

class Magic8
  ANSWERS = [
    "It is certain.",
    "It is decidedly so.",
    "Without a doubt.",
    "Yes - definitely.",
    "You may rely on it.",
    "As I see it, yes.",
    "Most likely.",
    "Outlook good.",
    "Yes.",
    "Signs point to yes.",
    "Reply hazy, try again.",
    "Ask again later.",
    "Better not tell you now.",
    "Cannot predict now.",
    "Concentrate and ask again.",
    "Don't count on it.",
    "My reply is no.",
    "My sources say no.",
    "Outlook not so good.",
    "Very doubtful."
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
    puts "-------------------------".colorize(:yellow)
    puts "What would you wish to do?".colorize(:green)
    puts "-------------------------".colorize(:yellow)
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
    menu
  end

  def add_answer
    puts "What Answer Do You Wish To Add?"
    user_answer = gets.strip
    if ANSWERS.include? user_answer
      puts "Answer Already Exists"
      add_answer
    else
      ANSWERS.push @user_answer
      puts "Your Answers Been Added"
      menu
    end
  end

  def answer_reset
    puts "Are You Sure? y/n"
    input = gets.strip.downcase
    if input == 'y'
      puts `clear`
      puts "The 8 Ball Has Been Reset"
      sleep(2)
      menu
    elsif input == 'n'
      puts 'Taking You Back To Main Menu'
      sleep(2)
      menu
    else
      puts 'Invalid Input'.colorize(:red)
      sleep(2)
      menu
    end
  end

  def show_answers
    puts ANSWERS
    menu
  end

end

magic = Magic8.new
magic.greeting

