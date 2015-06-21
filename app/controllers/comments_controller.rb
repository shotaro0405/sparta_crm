class CommentsController < ApplicationController
  def new
  end

  def create
    #customer ID 取得

    #user ID 取得

    #body 取得 (コメント本文)

    @comment = Comment.new(comment_params)
    @comment.save
    redirect_to customer_url(@comment.customer_id)
  end

  def destroy
    @comment = Comment.find(params[:id])
    customer = @comment.customer
    @comment.destroy
    redirect_to customer_url(customer)
  end

  private
  def comment_params
    params.require(:comment).permit(
      :body,
      :customer_id,
      :user_id
      )
  end
end
