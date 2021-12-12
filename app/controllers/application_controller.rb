# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  def set_user
    @user = current_user
  end
end
