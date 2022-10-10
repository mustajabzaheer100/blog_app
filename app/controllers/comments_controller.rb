# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :find_commentable, only: %i[create update edit destroy]

  def new
    @comment = Comment.new
  end

  def create
    @commentable.comments.build(comment_params)
    @commentable.save
    redirect_to post_path(params[:post_id] || params[:comment][:reply_post_id])
  end

  def edit; end

  def update
    @commentable.comments.update(comment_params)
    redirect_to post_path(params[:post_id] || params[:comment][:reply_post_id])
  end

  def destroy
    @commentable.comments.find_by(id: params[:id]).destroy
    redirect_to post_path(params[:post_id] || params[:child_post_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def find_commentable
    if params[:post_id].present?
      @commentable = Post.find_by(params[:post_id])
    elsif params[:comment_id]
      @commentable = Comment.find_by(params[:comment_id])
    end
  end
end
