class RegistrationsController < ApplicationController
  allow_unauthenticated_access only: [:new]

  def new
    @user = User.new
  end

  def create
    @user = User.new(registration_params)

    if @user.save
      redirect_to new_session_path
    else
      render :new, status: :unproccesable_entity
    end
  end

  private

  def registration_params
    params.expect([:email_address, :confirm_email_address, :password])
  end
end
