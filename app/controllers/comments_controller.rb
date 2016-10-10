class CommentsController < ApplicationController
  before_action :logged_in_user

  def create
    @comment = current_user.comments.build comment_params
    if @comment.save
      respond_to do |format|
        format.js
      end
    else
      flash[:danger] = t "comment.fail"
      redirect_to products_path
    end
  end

  def destroy
    @comment = current_user.comments.find_by id: params[:id]
    if @comment.nil?
      flash[:danger]= t "comment.not_found"
      redirect_to products_path
    else
      if @comment.destroy
        respond_to do |format|
          format.js
        end
      else
        flash[:danger] = t "comment.no_destroy "
        redirect_to products_path
      end
    end
  end

  private
  def comment_params
    params.require(:comment).permit :content, :product_id
  end
end
