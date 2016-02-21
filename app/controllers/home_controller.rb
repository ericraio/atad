class HomeController < ApplicationController

  def index
    if params[:ref]
      @inviter = User.where(ref_code: params[:ref]).first
      @user = User.new
    end
  end

end
