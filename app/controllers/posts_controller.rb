class PostsController < ApplicationController
  def show
    post = Post.find(params[:id])

    render json: post
  end

  def update
    post = Post.find(params[:id])

    post.update!(post_params)

    render json: post, status: :accepted
  rescue ActiveRecord::RecordInvalid => e
    render json: { errors: e.record.errors }, status: :unprocessable_entity
  end

  private

  def post_params
    params.permit(:category, :content, :title)
  end
end
