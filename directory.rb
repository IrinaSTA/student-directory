@students = []

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
  end
end

def get_input
  user_input = STDIN.gets.chomp.split(/[\s,]+/)
  # below will be a problem if we ever change keys
  user_input[1] = "november" if user_input[1] == nil
  return user_input
end

def keys
  keys = ["name", "cohort"]
end

def student_data(keys, get_input)
  values = get_input
  student = keys.zip(values).to_h
end

def input_students
  puts "Please enter the name and cohort of each student"
  puts "To finish, just hit return twice"
  student_info = get_input
  name = student_info[0]
  while name != nil do
    @students << student_data(keys, student_info)
    if @students.length == 1
      puts "Now we have #{@students.count} student"
    else
      puts "Now we have #{@students.count} students"
    end
    student_info = get_input
    name = student_info[0]
  end
  @students
end

def show_students
  print_header
  print_student_list
  print_footer
end

def print_header
  puts "The students of Villains Academy"
  puts "---------------"
end

def print_student_list
  @students.each_with_index do |student, index|
      puts "#{index + 1}. #{student["name"]} (#{student["cohort"]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    csv_line = student.values.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    values = line.chomp.split(",")
    @students << student_data(keys, values)
  end
  file.close
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} students from #{filename}"
  else
    puts "Sorry, #{filename} does not exist."
    exit
  end
end

try_load_students
interactive_menu
