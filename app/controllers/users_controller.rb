class UsersController < ApplicationController
  before_action :profile_holder?, only: [:show]

  def show

  end

  def profile_holder?
    id_ = params[:id]
    unless (user_signed_in? && (current_user == User.find(id_)))
      redirect_to ("/"), :alert => "Vous n'avez pas les droits faire ca."
    end
  end
end
