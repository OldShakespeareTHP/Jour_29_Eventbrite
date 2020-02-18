class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :guested_participations, foreign_key: "guest_id", class_name: "participation"
  has_many :events, :through => :guested_participations

  has_many :administred_events, foreign_key: "admnistrator_id", class_name: "events"

  after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
