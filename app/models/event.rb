class Event < ApplicationRecord
  validates :start_date, :duration, :title, :description, :price, :location, presence: true
  validate :start_date_after_now

  validates :duration, numericality: { greater_than: 0 }
  validate :duration_multiple_of_5?

  validates :title, length: { in: 5..140 }
  validates :description, length: { in: 20..1000 }
  validates :price, numericality: { greater_than: 1, less_than: 1000 }

  has_many :participations
  has_many :guests, :through => :participations, :source => :user


  belongs_to :administrator, class_name: 'User', foreign_key: 'administrator_id'

  private

  def start_date_after_now
    if start_date < Time.now
      errors.add(:start_date, "must be after now.")
      return false
    end
    return true
  end

  def duration_multiple_of_5?
    unless duration % 5 == 0
      errors.add(:duration, "must be a multiple of 5.")
      return false
    end
    return true
  end
end
