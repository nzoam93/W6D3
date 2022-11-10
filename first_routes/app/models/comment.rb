# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  body       :text             not null
#  author_id  :bigint           not null
#  artwork_id :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Comment < ApplicationRecord
  validates :body, :author_id, :artwork_id, presence: true


  belongs_to :author,
    foreign_key: :author_id,
    class_name: :User,
    inverse_of: :comments # has many comments through author

  belongs_to :artwork

end
