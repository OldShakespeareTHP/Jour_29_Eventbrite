class ParticipationsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  before_action :event_admin?, only: [:index]

  def index
    @event = Event.find(params[:event_id])
    @participation = @event.participations
  end

  def new
  end

  def create
    event_ = Event.find(params[:id])

    # Amount in cents
    @amount = event_.price

    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })
    # Stripe::Customer.create va enregistrer l’utilisateur chez Stripe. Elle va s’occuper de faire toutes les vérifications pour nous (validité de carte, informations transmises, etc…)
    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: "Paiement de #{current_user.first_name} #{current_user.last_name}",
      currency: 'eur',
    })
    # Stripe::Charge.create va créer la charge en la liant au customer que nous venons de créer

    participation = Participation.new(event: event_, user: current_user)
    unless participation.valid?
      flash[:error] = participation.errors.messages
    else
      participation.save
      flash[:success] = "Vous avez bien été inscrit à l'évènement."
    end
    redirect_back(fallback_location: root_path)

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to event_path(event_)
    # Ici le rescue est begin par le def
  end
end
