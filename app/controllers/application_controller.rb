class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def user_signed_in?
    session[:user_id].present?
  end
  helper_method :user_signed_in?

  def current_user
    @current_user ||= User.find session[:user_id] if user_signed_in?
  end
  helper_method :current_user

  def authenticate_user!
    redirect_to new_session_path unless user_signed_in?
  end

  def pet_owner?(pet)
    current_user == pet.user
  end
  helper_method :pet_owner?

  def your_pets
    @pets = current_user.pets
    @pets.each do |p|
      p.name
    end
  end
  helper_method :your_pets

  def has_pet?
    current_user.pets if defined? current_user.pets
  end
  helper_method :has_pet?

  def has_vet?
    current_user.pets.vet.name if defined? current_user.pets.vet.name
  end
  helper_method :has_vet?



end
