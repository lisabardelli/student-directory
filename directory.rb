# frozen_string_literal: true

@students = []
def print_menu
  puts '1. Input the students'
  puts '2. Show the students'
  puts '3. Save the list to a file'
  puts '4. Load the list from a file'
  puts '9. Exit'
end

def show_students
  print_header(@students)
  print_students_list(@students)
  print_footer(@students)
  puts 'Students have been printed'
end

def interactive_menu
  loop do
    print_menu
    process($stdin.gets.chomp)
  end
end

def enter_filename
  puts 'Enter the filename'
  filename = $stdin.gets.chomp
  filename = 'students.csv' if filename.empty?
  filename
end

def process(selection)
  case selection
  when '1'
    input_students
  when '2'
    show_students
  when '3'
    filename = enter_filename
    save_students(filename)
  when '4'
    filename = enter_filename
    load_students(filename)
  when '9'
    exit
  else
    puts "I don't know what you mean, try again"
  end
end

def print_header(_students)
  if @students.count.positive?
    puts 'The students of Makers Academy'.center(60)
    puts '-------------'.center(60)
  else
    puts 'No students in the Makers Academy'
  end
end

def add_student(name, cohort)
  @students << { name: name, cohort: cohort }
end

def input_students
  months = %w[january february march april may june july august september october november december]
  puts 'Please enter the names of the students'
  puts 'To finish, just hit return twice'
  name = $stdin.gets.gsub("\n", '')

  until name.empty?

    puts 'Please enter his/her cohort'
    cohort = $stdin.gets.gsub("\n", '')
    cohort = 'November' if cohort.empty?
    until months.include? cohort.chomp.downcase
      puts 'There must be a typo, please enter the cohort'
      cohort = gets
    end
    add_student(name, cohort.chomp)
    print_number_of_students
    name = $stdin.gets.chomp
  end
  puts 'The student has been entered'
end

def print_number_of_students
  if @students.count < 2
    puts "Now we have #{@students.count} student".center(60)
  else
    puts "Now we have #{@students.count} students".center(60)
  end
end

def print_students_list(students)
  students_by_cohort = {}
  students.each do |student|
    cohort = student[:cohort]
    name = student[:name]

    if students_by_cohort[cohort].nil?
      students_by_cohort[cohort] = [name]
    else
      students_by_cohort[cohort].push(name)
    end
  end
  students_by_cohort.each do |key, value|
    if value.length > 1
      puts "The students #{value.join(', ')} are in the  #{key} cohort."
    else
      puts "The student #{value.join} is in the  #{key} cohort."
    end
  end
end

def save_students(filename)
  File.open(filename, 'w') do |file|
    @students.each do |student|
      studen_data = [student[:name], student[:cohort]]
      csv_line = studen_data.join(',')
      file.puts csv_line
    end
  end
  puts 'Students have been saved'
end

def load_students(filename)
  @students = []
  File.open(filename, 'r') do |file|
    file.readlines.each do |line|
      name, cohort = line.chomp.split(',')
      add_student(name, cohort.to_sym)
    end
  end
  puts 'Students have been loaded'
end

def print_footer(_students)
  return if @students.count < 1

  if @students.count < 2
    puts "Overall, we have #{@students.count} great student".center(60)
  else
    puts "Overall, we have #{@students.count} great students".center(60)
  end
end
interactive_menu
