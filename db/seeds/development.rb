puts 'Creating User'
User.create(email: 'admin@contentbunch.com', password: 'password')

puts 'Adding static tool'
StaticTool.create(page_key: 'pak_player')
