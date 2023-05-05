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
puts "Please enter the names of the students".center(50)
puts "to finish, just hit return twice".center(50)

students = []

name = gets.chomp

while !name.empty? do
  
  students << {name: name, cohort: :november}
  puts "Now we have #{students.count} students".center(50)

  name = gets.chomp
end

students
end

print_header
print(students)
print_footer(students)
