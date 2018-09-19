@students = []

def input_students
  puts "Please enter the name and cohort of each student"
  puts "To finish, just hit return twice"

  user_input = gets.chomp.split(/[\s,]+/)
  name = user_input[0]
  # defaults to november if cohort is not entered
  if user_input[1] != nil
    cohort = user_input[1].to_sym
  else
    cohort = :november
  end # there is def a more graceful way to do this OR assignment

  while name != nil do
    @students << {name: name, cohort: cohort}
    if @students.length == 1
      puts "Now we have #{@students.count} student"
    else
      puts "Now we have #{@students.count} students"
    end
    # get another name from the user
    user_input = gets.chomp.split(/[\s,]+/) #this code is duplicated!
    name = user_input[0] #getting user input may be its own method?
    if user_input[1] != nil
      cohort = user_input[1].to_sym
    else
      cohort = :november
    end
  end
  # return the array of students
  @students
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

def show_students
  print_header
  print_student_list
  print_footer
end

def process(selection)
  case selection
    when "1"
      @students = input_students
    when "2"
      show_students
    when "9"
      exit #this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_header
  margin = 50
  puts "The students of Villains Academy".center(margin)
  puts "---------------".center(margin)
end

def print_student_list
  @students.each_with_index do |student, index|
      puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

interactive_menu
