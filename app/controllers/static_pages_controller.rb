class StaticPagesController < ApplicationController
  def index
    @events = Event.all
  end
end