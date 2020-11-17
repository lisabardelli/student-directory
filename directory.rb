def print_header(students)
    if students.count > 0
        puts 'The students of Makers Academy'.center(60)
        puts '-------------'.center(60)
    else
        puts 'No students in the Makers Academy'
    end
end


def input_students
    students = []
    months = ["january",'february', 'march', 'april', 'may', 'june', 'july', 'august', 'september', 'october', 'november', 'december']
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    name = gets.gsub("\n", "")
    # while name.empty?
    # puts "Please enter the names of the students"
    # name = gets.gsub("\n", "")
    # end

    while !name.empty? do
    puts 'Please enter his/her cohort'
    cohort = gets.gsub("\n", "")
        if cohort.empty?
            cohort = 'november'
        end
      while !months.include? cohort.chomp.downcase
        puts "There must be a typo, please enter the cohort"
        cohort = gets
      end
      students << { name: name, cohort: cohort.chomp }
      if students.count<2
        puts "Now we have #{students.count} student".center(60)
      else
      puts "Now we have #{students.count} students".center(60)
      end
      name = gets.chomp
    end
    students
  end

def print(students)
cohorts_array = []
    students_by_cohort = {}
  students.each do |student_details|
    if    students_by_cohort.key?(student_details[:cohort])
        students_by_cohort[student_details[:cohort]].<< ", #{student_details[:name]}"
    else
        students_by_cohort[student_details[:cohort]] = (student_details[:name])
    end
end
students_by_cohort.each do |key, value|
    puts "In the #{key} cohort, there is/are the following student/s #{value}"
end
end

def print_footer(students)
    if students.count<1
        return
    end
    if students.count<2
    puts "Overall, we have #{students.count} great student".center(60)
    else
    puts "Overall, we have #{students.count} great students".center(60)
    end
  end
students = input_students
print_header(students)
print(students)
print_footer(students)
