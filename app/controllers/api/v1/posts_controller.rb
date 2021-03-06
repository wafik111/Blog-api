class Api::V1::PostsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_post, only: [:show, :update, :destroy]


    def index
        render json: Post.all,status: 200
    end

    def show
        render json: @post,status: 200
    end

    def create
        @post = Post.create!(posts_params)
        render json: { message: "post created! ", data: @post}, status: 201
       
    end

    def update
        if @post.user_id == current_user.id
            if @post.update(posts_params)
                render json: { message: "post edited! ", data: @post}, status: 200
            else
                render json: { error: @post.errors.full_messages}, status: 405
            end
        else
            render json: {error: 'this user is not the author of this post'},status: 401
        end
    end

    def destroy
        if @post.user_id == current_user.id
            @post.destroy
            render json: { message: 'post Deleted'},status: 200
        else  
            render json: {error: 'this user is not the author of this post'},status: 401
        end
    end
    
    private

    def posts_params
        params.permit(:title, :body, :user_id, tags_attributes: [:tag])
    end
   
    def set_post
        @post = Post.find(params[:id])
    end
end
