require 'pry'

class CommentsController < ApplicationController

# Creando un nuevo comentario
  def create
    @post = Post.find(params[:post_id])
    @user = current_user.id
    @comment = @post.comments.create(params[:comment].permit(:name, :body))
    @comment.user_id = @user
    @comment.save
    redirect_to post_path(@post)
  end

# eliminando un comentario
def destroy
  @post = Post.find(params[:post_id])
  @user = current_user.id
  @comment = @post.comments.find(params[:id])
  @comment.user_id = @user
  @comment.destroy
  redirect_to post_path(@post)
end

end
