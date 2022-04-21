class FavoritesController < ApplicationController
  def create
    @favorite = current_user.favorites.create(art_id: params[:art_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @art = art.find(params[:art_id])
    @favorite = current_user.favorites.find_by(art_id: @art.id)
    @favorite.destroy
    redirect_back(fallback_location: root_path)
  end
end
