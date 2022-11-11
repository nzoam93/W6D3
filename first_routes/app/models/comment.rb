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
    #this routes through users/id/comments or artworks/id/comments
    #this required us to nest routes in the routes.rb file

  # def self.comments_for_author_or_artwork(params)
  #   if params.has_key?(:user_id) #user_id because it's routing through user
  #     comments = Comment.where('author_id=?',params[:user_id]) #author_id= because that's what we call it
  #   elsif params.has_key?(:artwork_id)
  #     comments = Comment.where('artwork_id=?',params[:artwork_id])
  #   end
  # end

    #this routes through comments and passing in a key-value pair
  def self.comments_for_author_or_artwork(params)
    if params.has_key?(:author_id)
      comments = Comment.where('author_id=?',params[:author_id]) #author_id= because that's what we call it
    elsif params.has_key?(:artwork_id)
      comments = Comment.where('artwork_id=?',params[:artwork_id])
    end
  end





end
