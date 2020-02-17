class User < ApplicationRecord
  has_many :guested_participations, foreign_key: "guest_id", class_name: "participation"
  has_many :events, :through => :guested_participations

  has_many :administred_events, foreign_key: "admnistrator_id", class_name: "events"
end
