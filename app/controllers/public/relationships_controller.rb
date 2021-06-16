class Public::RelationshipsController < ApplicationController

  def create
    current_customer.follow(params[:customer_id])
    redirect_to request.referer
  end

  def destroy
    current_customer.unfollow(params[:customer_id])
    redirect_to request.referer
  end

  def followings
    user = User.find(params[:customer_id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:customer_id])
    @users = user.followers
  end


end
