class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show]
  skip_before_action :authenticate_user!

  def show
    @appointment = current_user.appointments
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.find(set_appointment)
    @appointment.user_id = current_user.id
    @appointment.nudie_id = @nudie.id
    @appointment.save
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:location, :appointment_date)
  end
end
