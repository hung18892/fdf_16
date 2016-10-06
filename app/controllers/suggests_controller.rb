class SuggestsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :index]

  def index
    @suggests = Suggest.desc_created_at.paginate page: params[:page], 
      per_page: Settings.per_page
  end

  def new
    @suggest = current_user.suggests.build
  end

  def create
    @suggest = current_user.suggests.build suggest_params
    if @suggest.save
      flash[:success] = t "send_suggest"
      redirect_to suggests_path
    else
      flash[:danger] = t "suggest_faild"
      render :new
    end
  end

  private
  def suggest_params
    params.require(:suggest).permit :content
  end
end
