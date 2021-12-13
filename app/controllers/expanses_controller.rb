# frozen_string_literal: true

class ExpansesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :set_expanse, only: %i[show edit update destroy]

  # GET /expanses or /expanses.json
  def index
    @expanses = Expanse.all
  end

  # GET /expanses/1 or /expanses/1.json
  def show; end

  # GET /expanses/new
  def new
    @expanse = Expanse.new
  end

  # GET /expanses/1/edit
  def edit; end

  # POST /expanses or /expanses.json
  def create
    a = params['expanses']['user_id'].delete_if(&:blank?)
    # render json: expanse_params
    # return
    @expanse = Expanse.new(expanse_params)
    # render json: expanse_params
    # return

    respond_to do |format|
      # if @expanse.save
      @expanse.users(a) if @expanse.save
      flash[:notice] = 'Expanse was successfully created.'
      # format.html { redirect_to @expanse, notice: "Expanse was successfully created." }
      # format.json { render :show, status: :created, location: @expanse }
      # else
      # format.html { render :new, status: :unprocessable_entity }
      # format.json { render json: @expanse.errors, status: :unprocessable_entity }
      # end
      format.js
    end
  end

  # PATCH/PUT /expanses/1 or /expanses/1.json
  def update
    respond_to do |format|
      if @expanse.update(expanse_params)
        format.html { redirect_to @expanse, notice: 'Expanse was successfully updated.' }
        format.json { render :show, status: :ok, location: @expanse }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @expanse.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expanses/1 or /expanses/1.json
  def destroy
    @expanse.destroy
    respond_to do |format|
      format.html { redirect_to expanses_url, notice: 'Expanse was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_expanse
    @expanse = Expanse.find(params[:id])
  end

  def set_user
    @user = current_user
  end

  # Only allow a list of trusted parameters through.
  def expanse_params
    p = params.require(:expanses).permit(:title, :amount, :type, :status, :created_by_id)
    @paid_mail = params['expanses']['payor'].downcase
    p['paid_by_id'] = User.find_by(email: @paid_mail)&.id
    p['created_by_id'] = current_user.id
    p
  end
end
