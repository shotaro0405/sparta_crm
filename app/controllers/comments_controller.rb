class CommentsController < ApplicationController
  def new
  end

  def create
    @comment = Comment.new(comment_prams)
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
  def comment_prams
    params.require(:comment).permit(
      :body,
      :customer_id
      )
  end
end
