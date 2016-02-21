class HomeController < ApplicationController

  skip_before_action :load_user_if_set

  def index
    if params[:ref]
      @inviter = User.where(ref_code: params[:ref]).first
      @user = User.new
    end
  end

end
