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
  {name: "Norman Bates", cohort: :november}
]

def interactive_menu
  loop do
  # 1. print the menu and ask the user what to do
  puts "1. input the students"
  puts "2. show the students"
  puts "9 Exit"
  # 2. read the input and save it into a variable
  selection = gets.chomp
  # 3. do what the user has asked
  case selection
  when "1"
    # input the students
  when "2"
    # show the students
  else "9"
    puts "I don't know what you meant, try again"
end

def print_header
  puts "The students of Villains Academy".center(50)
  puts "---------------".center(50)
end

def print(students)
  cohorts = students.map { |student| student[:cohort] }.uniq

  cohorts.each do |cohort|
    puts "#{cohort} cohort:".center(50)
    students.each_with_index do |student, index|
      if student[:cohort] == cohort
        puts "#{index+1}. #{student[:name]}".center(50)
      end
    end
  end
end


def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(50)
end

def input_students
puts "Please enter the name and cohort of the student (seperated by a comma)".center(50)
puts "to finish, just hit return twice".center(50)

students = []

input = gets.delete_suffix("\n")

while !input.empty? do
  name, cohort = input.split(",")
  name = name.strip
  cohort = cohort ? cohort.strip.to_sym : :november

  students << {name: name, cohort: cohort}
  puts "Now we have #{students.count} students".center(50)

  input_students = gets.chomp
end

students
end

print_header
print(students)
print_footer(students)
