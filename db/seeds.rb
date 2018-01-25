require 'faker'

# Create My Account
my_account = User.create!(
  name:     'Matthew',
  email:    'mharr171.z@gmail.com',
  password: 'asdf123'
)
print '.'

# Create Admin Account
admin_account = User.create!(
  name:     'Admin',
  email:    'admin@attendance.com',
  password: 'asdf123'
)
print '.'

users = User.all
puts "\n#{User.count} users created"

# Create Test Groups
5.times do
  Group.create!(
    title:        Faker::Company.name,
    description:  Faker::Company.catch_phrase,
    user:         users.sample
  )
  print '.'
end

groups = Group.all
puts "\n#{Group.count} groups created"

# Create Test Members
150.times do
  @address = Faker::Address.street_address + ', ' + Faker::Address.state_abbr
  @phone_number = '(' + Faker::Number.number(3) + ')' + Faker::Number.number(3) + '-' + Faker::Number.number(4)
  @first_name = Faker::Name.first_name
  @last_name = Faker::Name.last_name
  @full_name = @first_name + @last_name
  Member.create!(
    first_name:   @first_name,
    last_name:    @last_name,
    address:      @address,
    phone_number: Faker::PhoneNumber.cell_phone,
    email:        Faker::Internet.free_email(@full_name),
    group:        groups.sample
  )
  print '.'
end

members = Member.all
puts "\n#{Member.count} members created"
