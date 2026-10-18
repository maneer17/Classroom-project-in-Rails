puts "Creating demo accounts..."

teacher = Teacher.find_or_initialize_by(email: "teacher@classroom.local")
teacher.assign_attributes(
  name: "Demo Teacher",
  password: "password123",
  confirmed_at: Time.current
)
teacher.save!

student = Student.find_or_initialize_by(email: "student@classroom.local")
student.assign_attributes(
  name: "Demo Student",
  password: "password123",
  confirmed_at: Time.current
)
student.save!

puts "Demo teacher: teacher@classroom.local / password123"
puts "Demo student: student@classroom.local / password123"