class CommentsController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @comment = @user.comments.new
  end

  def create
   @user = User.find(params[:user_id])
    @comment = @user.comments.create(comments_params)
    if @comment.save
      redirect_to user_comment_path(@user, @comment)
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:user_id])
    @comment = @user.comments.find(params[:id])
  end

  def edit
    @user = User.find(params[:user_id])
    @comment = @user.comments.find(params[:id])
  end

  def destroy
    @user = User.find(params[:user_id])
    @comment = @user.comments.find(params[:id])
    @comment.destroy
    redirect_to user_comments_path(@user)
  end

  def update
    user = User.find(params[:user_id])
    comment = user.comments.find(params[:id])
    if comment.update_attributes(comments_params)
      redirect_to user_comment_path(user,comment) 
    else 
      render 'edit'
    end
  end

  def index
    @user = User.find(params[:user_id])
    @comments = @user.comments.all
  end

  private 
  def comments_params
    params.require(:comment).permit(:comment,:user_id)
  end
end
