require "faker"

TARGET_ASSIGNMENT_COUNT = 20

puts "Creating assignments..."

courses = Course.all
existing = Assignment.count

if existing >= TARGET_ASSIGNMENT_COUNT
  puts "Already have #{existing} assignments, skipping."
else
  (TARGET_ASSIGNMENT_COUNT - existing).times do
    course = courses.sample
    deadline = Faker::Time.between(from: DateTime.now + 3, to: DateTime.now + 60, format: :long)

    Assignment.create!(
      deadline: deadline,
      title: Faker::Lorem.sentence(word_count: 4, random_words_to_add: 0).chomp(".").truncate(30, omission: ""),
      content: Faker::Lorem.paragraph(sentence_count: 4),
      course_id: course.id
    )
  end
end

puts "Created #{Assignment.count} assignments total."