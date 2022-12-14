# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
  validates :username, presence: true

  # has many
  has_many :artworks,
    foreign_key: :artist_id,
    dependent: :destroy,
    inverse_of: :artist

  has_many :artwork_shares,
    foreign_key: :viewer_id,
    dependent: :destroy,
    inverse_of: :viewer

  has_many :comments,
    foreign_key: :author_id,
    dependent: :destroy,
    inverse_of: :author



  # has many through
  has_many :shared_artworks,
    through: :artwork_shares,
    source: :artwork


end
