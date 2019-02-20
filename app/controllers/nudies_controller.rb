class NudiesController < ApplicationController
  before_action :set_nudie, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @nudies = policy_scope(Nudie).order(created_at: :desc)
  end

  def show
    @user = @nudie.user
  end

  def new
      @nudie = Nudie.new
      authorize @nudie
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

  private

  def set_nudie
    @nudie = Nudie.find(params[:id])
    authorize @nudie
  end

  def nudie_params
    params.require(:nudie).permit(:weight, :price, :description, :photo)
  end
end
