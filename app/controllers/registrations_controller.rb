class RegistrationsController < ApplicationController
  def new
    @registration = Registration.new
  end

  def edit
    @registration = Registration.find(params[:id])
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

  def confirm_delete
    @registration = Registration.find(params[:id])
    respond_to do |format|
      format.turbo_stream { render partial: 'registrations/confirm_delete', locals: { registration: @registration } }
      format.html
    end
  end



  def update
    @registration = Registration.find(params[:id])
    if @registration.update(registration_params)
      redirect_to registrations_path, notice: 'ข้อมูลถูกอัพเดตเรียบร้อยแล้ว'
    else
      render :edit
    end
  end

  def create
    @registration = Registration.new(registration_params)
    if @registration.save
      redirect_to registrations_path, notice: 'ส่งข้อมูลลงทะเบียนเรียบร้อยแล้ว!'
    else
      render :new
    end
  end

  private

  def registration_params
    params.require(:registration).permit(:first_name, :last_name, :birthday, :gender, :email, :phone, :subject)
  end
end
