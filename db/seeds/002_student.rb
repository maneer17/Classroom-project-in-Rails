require "faker"

puts "Creating students..."

15.times do
  email = Faker::Internet.unique.email
  name  = Faker::Name.name

  Student.find_or_create_by!(email: email) do |student|
    student.password      = "123456"
    student.name           = name
    student.confirmed_at   = Time.current
  end
end

puts "Created #{Student.count} students total."