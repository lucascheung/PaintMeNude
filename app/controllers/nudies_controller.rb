class NudiesController < ApplicationController
  before_action :set_nudie, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]
  skip_after_action :verify_authorized, only: [:male_filter, :female_filter]


  def index
    @nudies = policy_scope(Nudie)
    @markers = @nudies.map do |nudie|
      {
        lng: nudie.user.longitude,
        lat: nudie.user.latitude
      }
    end
  end

  def show
    @user = @nudie.user
  end

  def new
      @nudie = Nudie.new
      authorize @nudie
  end

  def create
      @nudie = Nudie.new(nudie_params)
      @user = current_user
      @nudie.user = @user
      @nudie.save
      authorize @nudie
      redirect_to user_path(@user)
  end

  def edit
  end

  def update
    if @nudie.update(nudie_params)
      redirect_to nudie_path(@nudie)
    else
      render :edit
    end
  end

  def destroy
    @nudie.destroy
    redirect_to nudies_path
  end

  def male_filter
    @nudies = policy_scope(Nudie).joins(:user).where(users: { gender: "Male"})
    respond_to do |format|
      format.html { redirect_to nudies_path(@nudies) }
      format.js
    end
  end

  def female_filter
    @nudies = policy_scope(Nudie).joins(:user).where(users: { gender: "Female"})
    respond_to do |format|
      format.html { redirect_to nudies_path(@nudies) }
      format.js
    end
  end

  private

  def set_nudie
    @nudie = Nudie.find(params[:id])
    authorize @nudie
  end

  def nudie_params
    params.require(:nudie).permit(:weight, :price, :description, :photo)
  end
end
