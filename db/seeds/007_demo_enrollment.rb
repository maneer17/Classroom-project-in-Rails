puts "Enrolling demo student..."

student = Student.find_by(email: "student@classroom.local")
courses = Course.limit(3)

if student
  courses.each do |course|
    next if StudentCourse.exists?(student_id: student.id, course_id: course.id)

    StudentCourse.create!(student: student, course: course)
    puts "  Enrolled demo student in #{course.name}"
  end
end