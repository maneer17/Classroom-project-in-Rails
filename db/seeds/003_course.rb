require "faker"
require "open-uri"

TARGET_COURSE_COUNT = 10

puts "Creating courses..."

teachers = Teacher.all

TARGET_COURSE_COUNT.times do
  course = Course.find_or_create_by!(name: Faker::Educator.unique.course_name) do |c|
    c.description = Faker::Lorem.paragraph(sentence_count: 3)
    c.teacher_id = teachers.sample.id
  end

  next if course.avatar.attached?

  begin
    image_url = "https://picsum.photos/seed/course-#{course.id}/800/600"
    downloaded_image = URI.open(image_url)

    course.avatar.attach(
      io: downloaded_image,
      filename: "cover_#{course.id}.jpg",
      content_type: "image/jpeg"
    )

    puts "  Attached avatar for course #{course.id}"
  rescue => e
    puts "  Could not fetch cover image for course #{course.id}: #{e.class} - #{e.message}"
  end
end

with_avatars = Course.joins(:avatar_attachment).count
puts "Created #{Course.count} courses total, #{with_avatars} with avatars."