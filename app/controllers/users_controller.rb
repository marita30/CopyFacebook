require 'pry'
class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @posts = Post.where("user_id = #{current_user.id}")
    # @posts = Post.where("timeline_id = #{@user.timeline.id}").order(created_at: :desc)
    # @users = User.all.where("id != ?", current_user.id).order(first_name: :asc)
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :image)   
  end
end
