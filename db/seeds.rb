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
