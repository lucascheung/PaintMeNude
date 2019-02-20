class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show]
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
    @appointment = Appointment.find(set_appointment)
    @appointment.user_id = current_user.id
    @appointment.nudy_id = Nudie.find(params[:nudy_id])
    @appointment.save
    authorize @appointment
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
