require 'set'

students = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Ratched", cohort: :november},
  {name: "Michael Corleone", cohort: :november},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Krueger", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Joffrey Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :november},
]

$cohorts = Set[:january, :february, :march, :april, :may, :june, :july,
              :august, :september, :october, :november, :december]

def input_students
  puts "Please enter the name and cohort of each student"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  user_input = gets.chomp.split(/[\s,]+/)
  name = user_input[0]
  cohort = user_input[1]
  if user_input[1] != nil
    cohort = user_input[1].to_sym
  else cohort = :november
  end # there is def a more graceful way to do this OR assignment
  # while the name is not empty, repeat this code
  while name != nil do
    # add the student hash to the array
    students << {name: name, cohort: cohort}
    if students.length == 1
      puts "Now we have #{students.count} student"
    else
      puts "Now we have #{students.count} students"
    end
    # get another name from the user
    user_input = gets.chomp.split(/[\s,]+/) #this code is duplicated!
    name = user_input[0]
    cohort = user_input[1].to_sym if user_input[1] != nil
  end
  # return the array of students
  students
end
$margin = 50
def print_header
  puts "The students of Villains Academy".center($margin)
  puts "---------------".center($margin)
end
def print(students)
  students_by_cohort = {}
  students.map do |student|
    students_by_cohort[student[:cohort]] ||= []
    students_by_cohort[student[:cohort]] << student[:name]
  end
  students_by_cohort.each do |key, value|
    puts "#{key}:"
    value.each {|name| puts "#{name}"}
  end
  # students.each_with_index do |student, index|
  #   if student[:name].length < 12
  #     puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)".center($margin)
  #   end
  # end
end
def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end
students = input_students
print_header
print(students)
print_footer(students)
