student = Student.find_by(email: "student@classroom.local")
course = Course.first

if student && course && !StudentCourse.exists?(student_id: student.id, course_id: course.id)
  StudentCourse.create!(student: student, course: course)
  puts "Enrolled demo student in #{course.name}"
end
