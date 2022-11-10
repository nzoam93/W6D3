class CommentsController < ApplicationController

  def index
    comments = Comment.all
    render json: comments
  end

  def create
      comment = Comment.new(comment_params)
      if comment.save
        render json: comment
      else
        render json: comment.errors.full_messages, status: :unprocessable_entity
      end
    end

    def destroy
      comment = Comment.find_by(id: params[:id])
      if comment.nil?
          render json: "not in the database"
      else
          comment.destroy
          render json: comment
      end
    end

    private
    def comment_params
      params.require(:comment).permit(:body, :author_id, :artwork_id)
    end

end
