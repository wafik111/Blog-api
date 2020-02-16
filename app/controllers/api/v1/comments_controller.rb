class Api::V1::CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post
  before_action :set_post_comment, only: [:show, :update, :destroy]

    def index
      render json: @post.comments, status: 200
    end

    def create
      @post.comments.create!(comment_params)
      render json: @post, status: :created
    end

    def update
      render json: @comment.update(comment_params), status: :updated if @comment.user_id == current_user.id  
    end
     
    def destroy
      if @comment.user_id == current_user.id  
        @comment.destroy
        render json: {message: 'deleted'}
      else
        render json: {message: 'not ypur comment to delete'}
      end
    end
     
      private
        def comment_params
          params.require(:comment).permit(:content, :user_id)
        end

        def set_post
          @post = Post.find(params[:post_id])
        end

        def set_post_comment
          @comment = @post.comments.find_by!(id: params[:id]) if @post
        end
end
