require 'pry'
require 'colorize'

class Magic8
  # String.color_samples

  def initialize
    @answers = [
      "It is certain",
      "It is decidedly so",
      "Without a doubt",
      "Yes - definitely",
      "You may rely on it",
      "As I see it, yes",
      "Most likely",
      "Outlook good",
      "Yes",
      "Signs point to yes",
      "Reply hazy, try again",
      "Ask again later",
      "Better not tell you now",
      "Cannot predict now",
      "Concentrate and ask again",
      "Don't count on it",
      "My reply is no",
      "My sources say no",
      "Outlook not so good",
      "Very doubtful"
    ]

    @answers_backup = @answers.map(&:clone)
  end

  def greeting
    puts ""
    puts ""
    puts '    Welcome to Magic 8 Ball'.colorize(:magenta)
    puts "================================".colorize(:light_red)
    puts "88888888888888888888888888888888".colorize(:cyan)
    puts "================================".colorize(:light_red)
    puts ""
    puts ""
    menu
  end

  def menu
    puts "=========================".colorize(:yellow)
    puts "What would you wish to do?".colorize(:magenta)
    puts "=========================".colorize(:yellow)
    puts "1) Ask A Question".colorize(:light_red)
    puts "2) Add An Answer".colorize(:light_red)
    puts "3) Answer Reset".colorize(:light_red)
    puts "4) Print All Answers".colorize(:light_red)
    puts "5) Exit".colorize(:red)
    @user_input = gets.to_i
    menu_choice
  end

  def menu_choice
    case @user_input
    when 1
      ask_question
    when 2
      add_answer
    when 3
      answer_reset
    when 4
      show_answers
    when 5
      puts "Goodbye".colorize(:magenta)
      sleep(2)
      puts `clear`
      exit
    else
      puts "invalid input".colorize(:red)
      sleep(2)
      menu
    end
  end

  def ask_question
    puts "Ask Me A Question".colorize(:magenta)
    question = gets.strip
    puts '.......shaking'.colorize(:cyan)
    sleep(2)
    puts '~~~~~~~~~~~~~~~~~~~'.colorize(:light_red)
    puts @answers.sample.colorize(:light_blue)
    puts '~~~~~~~~~~~~~~~~~~~'.colorize(:light_red)
    sleep(2)
    puts 'Ask again? (y/n)'
    answer = gets.strip.downcase
    if answer == 'y'
      ask_question
    elsif answer =='n'
      menu
    else
      puts 'Invalid Input'.colorize(:red)
    end
  end

  def add_answer
    puts "What Answer Do You Wish To Add?".colorize(:magenta)
    user_answer = gets.strip
    if @answers.include? user_answer
      puts "Answer Already Exists".colorize(:red)
      sleep(1)
      add_answer
    else
      @answers.push user_answer
      puts "Your Answers Been Added".colorize(:green)
      sleep(1)
      menu
    end
  end

  def answer_reset
    puts "Are You Sure? y/n".colorize(:red)
    input = gets.strip.downcase
    if input == 'y'
      @answers = @answers_backup.map(&:clone)
      puts `clear`
      puts "The 8 Ball Has Been Reset".colorize(:magenta)
      sleep(2)
      menu
    elsif input == 'n'
      puts 'Taking You Back To Main Menu'.colorize(:magenta)
      sleep(2)
      menu
    else
      puts 'Invalid Input'.colorize(:red)
      sleep(2)
      menu
    end
  end

  def show_answers
    puts 'Current Answers'.colorize(:magenta)
    puts @answers
    menu
  end

end

magic = Magic8.new
magic.greeting
