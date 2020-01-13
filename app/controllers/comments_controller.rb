class CommentsController < ApplicationController

  def create
    comment = Comment.create(comment_params)
    redirect_to "/items/#{comment.item.id}" 
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :user_id, :item_id).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end