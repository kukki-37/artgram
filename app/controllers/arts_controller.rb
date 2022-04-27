class ArtsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def new
    @art = Art.new
  end

  def create
    @art = current_user.arts.build(art_params)
    if @art.save
      redirect_to art_path(@art), notice: "作品を投稿しました。"
    else
      render :new
    end
  end

  def index
    @arts = Art.page(params[:page]).per(3)
    
  end

  def show
    @art = Art.find(params[:id])
    @arts = Art.page(params[:page]).per(3)
    @comments = @art.comments.page(params[:page]).per(3).reverse_order
    @comment = Comment.new
  end

  def edit
    @art = Art.find(params[:id])
    if @art.user != current_user
        redirect_to arts_path, alert: "不正なアクセスです。"
    end
  end
  
  def search
    
    @arts = Art.search(params[:keyword]).page(params[:page]).per(3)
    @keyword = params[:keyword]
    render "index"
  end

  def update
    @art = Art.find(params[:id])
    if @art.update(art_params)
      redirect_to art_path(@art), notice: "作品を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    art = Art.find(params[:id])
    art.destroy
    redirect_to user_path(art.user), notice: "作品を削除しました。"
  end
  
  def favorites
    favorites = Favorite.where(user_id: @user.id).pluck(:art_id)
    @favorite_arts = Art.find(favorites)
    @arts = Art.page(params[:page]).per(3)
  end

  private
  def art_params
    params.require(:art).permit(:title, :body, :image, :comment)
  end
end