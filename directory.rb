@students = []
def print_menu
  puts '1. Input the students'
  puts '2. Show the students'
  puts '3. Save the list to students.csv'
  puts '4. Load the list from students.csv'
  puts '9. Exit'
end

def show_students
  print_header(@students)
  print_students_list(@students)
  print_footer(@students)
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
  when '1'
    input_students
  when '2'
    show_students
  when '3'
    save_students
  when '4'
    load_students
  when '9'
    exit
  else
    puts "I don't know what you mean, try again"
  end
end

def print_header(students)
  if students.count > 0
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
  name = STDIN.gets.gsub("\n", '')

  until name.empty?

    puts 'Please enter his/her cohort'
    cohort = STDIN.gets.gsub("\n", '')
    cohort = 'November' if cohort.empty?
    until months.include? cohort.chomp.downcase
      puts 'There must be a typo, please enter the cohort'
      cohort = gets
    end
    add_student(name, cohort.chomp)
    if @students.count < 2
      puts "Now we have #{@students.count} student".center(60)
    else
      puts "Now we have #{@students.count} students".center(60)
    end
    name = STDIN.gets.chomp
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

def save_students
  file = File.open('students.csv', 'w')
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(',')
    file.puts csv_line
  end
  file.close
end

def load_students(_filename = 'students.csv')
  @students = []
  file = File.open('students.csv', 'r')
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    add_student(name, cohort.to_sym)
  end
  file.close
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?

  if File.exist?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
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
