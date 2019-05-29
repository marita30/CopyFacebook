require 'pry'

class CommentsController < ApplicationController

  def create
    binding.pry
    @post = Post.find(params[:post_id])
    @user = current_user.id
    @comment = @post.comments.create(params[:comment].permit(:name, :body))
    @comment.user_id = @user
    @comment.save
    redirect_to post_path(@post)
  end
end
