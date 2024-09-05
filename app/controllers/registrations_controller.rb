class RegistrationsController < ApplicationController
  def new
    @registration = Registration.new
  end

  def index
    @registrations = Registration.all
  end

  def main
  end

  def destroy
    @registration = Registration.find(params[:id])
    @registration.destroy
    redirect_to registrations_path, notice: 'ลบข้อมูลสำเร็จ'
  end

  def create
    @registration = Registration.new(registration_params)
    if @registration.save
      redirect_to registrations_new_path, notice: 'ส่งข้อมูลลงทะเบียนเรียบร้อยแล้ว!'
    else
      render :new
    end
  end

  private

  def registration_params
    params.require(:registration).permit(:first_name, :last_name, :birthday, :gender, :email, :phone, :subject)
  end
end
