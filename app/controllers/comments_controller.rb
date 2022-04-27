class CommentsController < ApplicationController

  def create
    art = Art.find(params[:art_id])
    comment = current_user.comments.new(comment_params)
    comment.art_id = art.id
    comment.save
    redirect_to art_path(art)
  end


  def destroy
    art = Art.find(params[:art_id])
    comment = current_user.comments.find_by(art_id: art.id)
    comment.destroy
    redirect_to art_path(params[:art_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:board_id, :name, :comment)
  end
end
  