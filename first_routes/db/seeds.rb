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
  ArtworkShare.destroy_all
  Artwork.destroy_all
  User.destroy_all


  # Reset primary keys (i.e., ids)
  puts 'Resetting id sequences...'
  %w(users artwork_shares artworks).each do |table_name|
    ApplicationRecord.connection.reset_pk_sequence!(table_name)
  end

  # Create seed data
  puts 'Creating seed data...'

  u1 = User.create!(username: 'noam zimet')
  u2 = User.create!(username: 'will bannister')
  u3 = User.create!(username: 'alvin')
  u4 = User.create!(username: 'alexander')
  u5 = User.create!(username: 'bobby')
  u6 = User.create!(username: 'dave')
  u7 = User.create!(username: 'lucy')
  u8 = User.create!(username: 'anna')


  a1 = Artwork.create!(title: 'mona lisa', image_url: 'google.com', artist_id: u1.id)
  a2 = Artwork.create!(title: 'the persistence of time', image_url: 'google2.com', artist_id: u2.id)
  a3 = Artwork.create!(title: 'american gothic', image_url: 'googl3e.com', artist_id: u1.id)
  a4 = Artwork.create!(title: 'the scream', image_url: 'goog4le.com', artist_id: u4.id)

  ArtworkShare.create!(artwork_id: a1.id, viewer_id: u2.id) # shares mona lisa with will
  ArtworkShare.create!(artwork_id: a4.id, viewer_id: u1.id) # shares the scream with noam

  c1 = Comment.create!(body: 'great artwork', artwork_id: 4, author_id: 1)
  c2 = Comment.create!(body: 'weird eyes', artwork_id: 1, author_id: 2)
  c3 = Comment.create!(body: 'sublime', artwork_id: 2, author_id: 1)

  puts 'Done!'
end
