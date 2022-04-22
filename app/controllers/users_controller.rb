class UsersController < ApplicationController
   before_action :set_user, only: [:favorites]
  def index
    @users = User.all
    @users = User.all.page(params[:page]).per(3)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
        redirect_to user_path(current_user), alert: "不正なアクセスです。"
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "ユーザー情報を更新しました。"
    else
      render :edit
    end
  end

  def favorites
    favorites = Favorite.where(user_id: @user.id).pluck(:art_id)
    @favorite_arts = Art.find(favorites)
  end
  
  private
  def set_user
    @user = User.find(params[:id])
  end


  private
  def user_params
    params.require(:user).permit(:username, :email, :profile, :profile_image)
  end
end