# frozen_string_literal: true

class MainController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  def dashboard
    @user = current_user
    @friends = @user.friends
    # @expanses = @user.expanse_data
    # render json: @expanses
    
  end

  def search_res
    puts params[:q]
    @user = current_user
    @res = User.query_search(params[:q])
    # @res.map(&:search_res)
    # render json: {users: @res}
    # return  @res.to_json
  end

  def friend_dash
    @friend = @user.friends.find{|frnd| frnd.id == params[:id].to_i}
    # render json: @friend
  end

end
