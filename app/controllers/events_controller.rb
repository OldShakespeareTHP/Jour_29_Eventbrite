class EventsController < ApplicationController
  before_action :user_signed_in?, only: [:create]
  before_action :event_admin?, only: [:edit, :update, :destroy]

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

  def edit
    @event = Event.find(params[:id])

    hour = @event.duration / 60
    min = @event.duration % 60

    @duration = "#{hour / 10}#{hour % 10}:#{min / 10}#{min % 10}"
    puts "%" * 60
    puts @duration
  end

  def update
    event = Event.find(params[:id])

    time_array = params[:duration].split(":").map(&:to_i)
    time_ = time_array[0] * 60 + time_array[1]
    attributes = {
      start_date: params[:start_date],
      duration: time_,
      title: params[:title],
      description: params[:description],
      price: params[:price].to_i,
      location: params[:location],
      start_date: params[:start_date],
      administrator: current_user
      } 
    if event.update(attributes)
      flash[:success] = "L'évènement a bien été mis à jour."
      redirect_to event_path(event)
    else
      flash[:errors] = event_.errors.messages
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    event_ = Event.find(params[:id])
    Participation.all.select {|p| p.event == event_}.each {|p| p.destroy}
    event_.destroy
    redirect_to root_path
  end

end
