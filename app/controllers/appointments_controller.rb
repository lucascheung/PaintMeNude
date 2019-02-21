class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :destroy]
  skip_before_action :authenticate_user!, only: [:new]

  def show
    @appointment = current_user.appointments
  end

  def new
    @appointment = Appointment.new
    @nudie = Nudie.find(params[:nudy_id])
    authorize @appointment
  end


  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.user = current_user
    @appointment.nudie = Nudie.find(params[:nudy_id])
    if @appointment.save
      redirect_to nudies_path
    else
      render :new
    end
    authorize @appointment
  end

  def destroy
    # @appointment = Appointment.find(params[:nudy_id])
    # authorize @appointment
    @appointment.destroy
    redirect_to user_path(current_user.id)
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:id])
    authorize @appointment
  end

  def appointment_params
    params.require(:appointment).permit(:location, :appointment_date)
  end
end
