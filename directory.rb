require 'csv'

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
    process(gets.chomp)
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
  when "9"
    exit
  else
    puts "I don't know what you meant, try again"
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  
  name = gets.chomp
  
  while !name.empty? do
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    name = gets.chomp
  end

  puts "All students added successfully!"
end

def add_student(name, cohort)
  @students << { name: name, cohort: cohort }
  puts "Added #{name} to the list"
end

def show_students
  print_header
  print_student_list
  print_footer
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count}"
end

def save_students
  puts "Enter filename to save to (default: students.csv):"
  filename = gets.chomp
  filename = "students.csv" if filename.empty?

  CSV.open(filename, "w") do |csv|
    @students.each do |student|
      csv << [student[:name], student[:cohort]]
    end
  end

  puts "Students saved successfully to #{filename}!"
end

def load_students(filename = "students.csv")
  puts "Enter filename to load from (default: students.csv):"
  filename = gets.chomp
  filename = "students.csv" if filename.empty?

  CSV.foreach(filename) do |row|
    name, cohort = row
    add_student(name, cohort.to_sym)
  end

  puts "Students loaded successfully from #{filename}!"
end

def try_load_students
  filename = ARGV.first || "students.csv"
  if File.exist?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

filename = __FILE__
File.open(filename, "r") do |file|
  file.each_line do |line|
    puts line
  end
end

try_load_students
interactive_menu