def print_header
  puts 'The students of Makers Academy'
  puts '-------------'
end


def input_students
    students = []
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    name = gets.chomp

    while !name.empty? do
        puts 'Please enter his/her hobbies'
        hobbies = gets
        puts 'Please enter his/her country of birth'
        country = gets
        students << { name: name, cohort: :november, hobbies: hobbies.chomp, country_of_birth: country.chomp }
      puts "Now we have #{students.count} students"
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
      puts "#{student[:name]} (#{student[:cohort]} cohort). He/she likes #{student[:hobbies]} and is from #{student[:country_of_birth]}."
      count_student += 1
    end
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end
students = input_students
print_header
print(students)
print_footer(students)
