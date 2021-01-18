puts 'Destroying users..'
User.destroy_all

puts 'Creating users..'
User.create!(
  username: 'JBertoldi',
  email: ENV['USER_EMAIL_1'],
  password: ENV['USER_PASSWORD'],
  confirmed_at: Time.now
)

User.create!(
  username: 'JoanaBanana',
  email: ENV['USER_EMAIL_2'],
  password: ENV['USER_PASSWORD'],
  confirmed_at: Time.now
)
