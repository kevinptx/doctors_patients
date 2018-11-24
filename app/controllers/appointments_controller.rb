class AppointmentsController < ApplicationController
  before_action :set_physician
  before_action :set_patients, only: [:new, :create]

  def index
    @appointments = Appointment.all.order(:datetime)
  end

  def show
    @patient = @appointment.patient.find(params[:id])
    @physician = @appointment.physician.find(params[:physician_id])
  end

  def new
    @appointment = @physician.appointments.new
  end

  def create
    @appointment = @physician.appointments.new(appointment_params)
    if @appointment.save
      redirect_to physician_appointments_path
    else
      render :new
    end
  end

  def destroy
    @physician.appointments.find(params[:id]).destroy
    redirect_to physician_appointments_path
  end

  private

  def set_patients
    @patients = (Patient.all.order("last_name") - @physician.patients)
  end

  def set_physician
    @physician = Physician.find(params[:physician_id])
  end

  def appointment_params
    params.require(:appointment).permit(:patient_id, :datetime)
  end
end
