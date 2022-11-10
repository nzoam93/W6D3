# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  image_url  :string           not null
#  artist_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Artwork < ApplicationRecord
  validates :title, :image_url, :artist_id, presence: true
  validates :image_url, uniqueness: true
  validates :artist_id, uniqueness: { scope: :title }

  # belongs to
  belongs_to :artist,
    class_name: :User,
    foreign_key: :artist_id

  # has many
  has_many :artwork_shares,
    dependent: :destroy

  has_many :comments,
    dependent: :destroy

  # has many through
  has_many :shared_viewers,
    through: :artwork_shares,
    source: :viewer

  def self.artworks_for_user_id(id) # class method because it's called with Artwork.artworks_for_user_id
    proprietary_art = Artwork.where(artist_id: id) # could also use: .where('artist_id = ?', id)

    shared_art = User.find_by(id: id).shared_artworks

    proprietary_art | shared_art
  end

end
