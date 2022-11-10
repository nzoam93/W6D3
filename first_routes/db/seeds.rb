# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


ApplicationRecord.transaction do
  # Destroy tables (not necessary if using `rails db:seed:replant`)
  puts 'Destroying tables...'
  User.destroy_all

  # Reset primary keys (i.e., ids)
  puts 'Resetting id sequences...'
  %w(users).each do |table_name|
    ApplicationRecord.connection.reset_pk_sequence!(table_name)
  end

  # Create seed data
  puts 'Creating seed data...'
  u1 = User.create!(name: 'noam zimet', email: 'nz@gmail.com')
  u2 = User.create!(name: 'will bannister', email: 'wb@gmail.com')
  u3 = User.create!(name: 'will bannister', email: 'wb@gmail.com')
  u4 = User.create!(name: 'will bannister', email: 'wb@gmail.com')
  u5 = User.create!(name: 'will bannister', email: 'wb@gmail.com')
  u6 = User.create!(name: 'will bannister', email: 'wb@gmail.com')
  u7 = User.create!(name: 'will bannister', email: 'wb@gmail.com')
  u8 = User.create!(name: 'will bannister', email: 'wb@gmail.com')

  puts 'Done!'
end
