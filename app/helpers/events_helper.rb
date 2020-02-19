module EventsHelper
  
  def end_date(event)
    Time.at(event.start_date + event.duration)
  end
end
