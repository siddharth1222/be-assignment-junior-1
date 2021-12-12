# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  def search_res
    # puts params[:q]
    # render json: params[:q]
    # return 'sdfds'
    # @user = current_user
    @res = User.query_search(params[:q])
    @res
  end

  def add_friend
    @frnd = User.find_by(id: params[:id])
    @create_frnd = current_user.add_frnd(@frnd)
    respond_to do |format|
      format.js
    end
    # if @create_frnd
    #     render json: "added"
    # else
    #     render json: "error"
    # end
  end

  def friend_profile
    @user = User.find_by(id: params[:id])
  end

  private

  def set_user
    @user = current_user
  end
end
