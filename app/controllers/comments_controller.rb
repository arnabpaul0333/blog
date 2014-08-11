class CommentsController < ApplicationController

  def new
    @user= User.find(params[:user_id])
    @comment= @user.comments.new
  end

  def create
   user=User.find(params[:user_id])
    comment=user.comments.create(comments_params)
    redirect_to user_comment_path(user, comment)
  end

  def show
    @user=User.find(params[:user_id])
    @comment=@user.comments.find(params[:id])
  end

  def edit
    @user=User.find(params[:user_id])
    @comment=@user.comments.find(params[:id])
  end

  def update
    user=User.find(params[:user_id])
    comment=user.comments.find(params[:id])
    comment.update_attributes(comments_params)
    redirect_to user_comment_path(user,comment) 
  end


  def index
    @user=User.find(params[:user_id])
    @comments=@user.comments.all
  end

  private 
  def comments_params
    params.require(:comment).permit(:comment,:user_id)
  end
end
