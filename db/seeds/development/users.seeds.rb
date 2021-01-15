puts 'Destroying users..'
User.destroy_all

puts 'Creating users..'
User.create!(
  username: 'JBertoldi',
  email: 'joanasoares_1994@msn.com',
  password: ENV['USER_PASSWORD'],
  confirmed_at: Time.now
)

User.create!(
  username: 'JoanaBanana',
  email: 'joana.bertoldisoares@gmail.com',
  password: ENV['USER_PASSWORD'],
  confirmed_at: Time.now
)
