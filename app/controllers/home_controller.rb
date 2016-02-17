class HomeController < ApplicationController
  def index
    if params[:ref]
      @referral = User.where(ref_code: params[:ref]).first
    end
  end

end
