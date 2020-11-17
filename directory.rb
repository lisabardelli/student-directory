def print_header
  puts 'The students of Makers Academy'.center(60)
  puts '-------------'.center(60)
end


def input_students
    students = []
    months = ["january",'february', 'march', 'april', 'may', 'june', 'july', 'august', 'september', 'october', 'november', 'december']
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    name = gets.chomp
    while name.empty?
    puts "Please enter the names of the students"
    name = gets.chomp
    end

    while !name.empty? do
    puts 'Please enter his/her cohort'
    cohort = gets.chomp
        if cohort.empty?
            cohort = 'november'
        end
      while !months.include? cohort.chomp.downcase
        puts "There must be a typo, please enter the cohort"
        cohort = gets
      end
      students << { name: name, cohort: cohort.chomp }
      puts "Now we have #{students.count} students".center(60)
      name = gets.chomp
    end
    students
  end

def print(students)
  count_student = 0
  tot_student = students.count
  while count_student < tot_student
    (0...students.length).each do |i|
      student = students[i]
      puts "#{student[:name]} (#{student[:cohort]} cohort).".center(60)
      count_student += 1
    end
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(60)
end
students = input_students
print_header
print(students)
print_footer(students)
