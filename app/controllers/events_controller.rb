class EventsController < ApplicationController
  before_action :user_signed_in?, only: [:create]

  def new

  end

  def create
    time_array = params[:duration].split(":").map(&:to_i)
    time_ = time_array[0] * 60 + time_array[1]

    event_ = Event.new(
      start_date: params[:start_date],
      duration: time_,
      title: params[:title],
      description: params[:description],
      price: params[:price].to_i,
      location: params[:location],
      start_date: params[:start_date],
      administrator: current_user
    )

    if event_.valid?
      event_.save
      redirect_to event_path(event_)
      # redirect_to ("/"), :alert => "L'evenement a bien ete cree"
    else
      flash[:alert] = event_.errors.messages
      redirect_back(fallback_location: root_path)
    end
  end

  def show
    @event = Event.find(params[:id])
  end


end
