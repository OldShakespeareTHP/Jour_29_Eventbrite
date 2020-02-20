class ApplicationController < ActionController::Base
  def event_admin?
    event_ = Event.find(params[:id])
    unless current_user == event_.administrator
      redirect_to root_path, :alert => "Vous n'avez pas les droits faire ca."
      # Tester un redirect_back avec un flash.now, pour bien comprendre son fonctionnement
    end
  end
end
