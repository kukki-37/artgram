class FavoritesController < ApplicationController
  def create
    @art = Art.find(params[:art_id])
    @favorite = current_user.favorites.create(art_id: params[:art_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    art = Art.find(params[:art_id])
    favorite = current_user.favorites.find_by(art_id: art.id)
    favorite.destroy
    redirect_to request.referer
  end

end