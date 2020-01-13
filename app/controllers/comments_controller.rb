class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      # 戻り値がtrueなので成功
      redirect_to item_url(@comment.item.id)
    else
      # 戻り値がfalseなので失敗
      render :show
    end  
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :user_id, :item_id).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
