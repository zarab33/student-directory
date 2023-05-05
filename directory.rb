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

def print_header
  puts "The students of Villains Academy".center(50)
  puts "---------------".center(50)
end

def print(students)
  index = 0
  while index < students.length do
    student = students[index]
    if student[:name].start_with?('D') && student[:name].length < 12
      puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)".center(50)
    end
    index += 1
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(50)
end

def input_students
puts "Please enter the name and cohort of the student (seperated by a comma)".center(50)
puts "to finish, just hit return twice".center(50)

students = []

input = gets.chomp

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
