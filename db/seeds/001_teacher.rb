require "faker"

puts "Creating teachers..."

5.times do
  email = Faker::Internet.unique.email
  name  = Faker::Name.name

  Teacher.find_or_create_by!(email: email) do |teacher|
    teacher.password      = "123456"
    teacher.name           = name
    teacher.confirmed_at   = Time.current
  end
end

puts "Created #{Teacher.count} teachers total."