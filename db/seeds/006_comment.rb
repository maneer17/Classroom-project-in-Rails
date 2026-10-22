require "faker"

TARGET_TEACHER_COMMENTS = 10
TARGET_STUDENT_COMMENTS = 25

puts "Creating comments..."

posts = Post.all
teachers = Teacher.all
students = Student.all

existing_teacher_comments = Comment.where(commenter_type: "Teacher").count
existing_student_comments = Comment.where(commenter_type: "Student").count

if existing_teacher_comments < TARGET_TEACHER_COMMENTS
  (TARGET_TEACHER_COMMENTS - existing_teacher_comments).times do
    Comment.create!(
      body: Faker::Lorem.sentence(word_count: 10),
      post_id: posts.sample.id,
      commenter_id: teachers.sample.id,
      commenter_type: "Teacher"
    )
  end
end

if existing_student_comments < TARGET_STUDENT_COMMENTS
  (TARGET_STUDENT_COMMENTS - existing_student_comments).times do
    Comment.create!(
      body: Faker::Lorem.sentence(word_count: 8),
      post_id: posts.sample.id,
      commenter_id: students.sample.id,
      commenter_type: "Student"
    )
  end
end

puts "Created #{Comment.count} comments total."