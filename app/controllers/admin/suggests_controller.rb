class Admin::SuggestsController < ApplicationController
  before_action :logged_in_user, only: [:index]
  before_action :admin_user

  def index
    @suggests = Suggest.desc_created_at.paginate page: params[:page], 
      per_page: Settings.per_page
  end
  
  private
  def suggest_params
    params.require(:suggest).permit :content
  end
end
