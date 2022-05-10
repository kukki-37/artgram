class FavoritesController < ApplicationController
  before_action :set_item 
  def create
    @art = Art.find(params[:art_id])  
    favorite = current_user.favorites.new(art_id: @art.id)
    favorite.save
    
  end

  def destroy
    art = Art.find(params[:art_id])
    favorite = current_user.favorites.find_by(art_id: art.id)
    favorite.destroy
    
  end
  
  private

  def set_item
    @art = Art.find_by(id: params[:art_id])
  end
end