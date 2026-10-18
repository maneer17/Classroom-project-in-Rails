require "faker"

TARGET_POST_COUNT = 20

puts "Creating posts..."

courses = Course.all
existing = Post.count

if existing >= TARGET_POST_COUNT
  puts "Already have #{existing} posts, skipping."
else
  (TARGET_POST_COUNT - existing).times do
    course = courses.sample

    Post.create!(
      title: Faker::Lorem.sentence(word_count: 5).chomp("."),
      body: Faker::Lorem.paragraph(sentence_count: 5),
      course_id: course.id
    )
  end
end

puts "Created #{Post.count} posts total."