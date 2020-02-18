class UserMailer < ApplicationMailer
  default from: 'no-reply@monsite.fr'

  def welcome_email(user)
    @user = user
    @url = 'http://monsite.fr/login'
    mail(to: @user.email, subject: 'Bienvenue chez nous !')
  end

  def inform_admin_for_new_guest(participation)
    @event = participation.event
    @admin = @event.administrator
    @guest = participation.user

    mail(to: @admin.email, subject: "Nouvel inscrit a l\evenement #{@event.title}")
  end
end
