class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :participations
  # has_many :guested_events, foreign_key: "guest", class_name: "Event", :through => :participations
  has_many :guested_events, :through => :participations, :source => :event

  has_many :administred_events, foreign_key: "administrator", class_name: "Event"

  after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
