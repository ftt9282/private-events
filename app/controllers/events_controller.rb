class EventsController < ApplicationController
  def index
  end

  def new
  	@event = Event.new
  end

  def create
  	@event = current_user.events.build(event_params)
  	@event.save
  	redirect_to current_user
  end

  def show
  	@event = Event.find(params[:id])
  end

  def index
    @events = Event.all
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :date)
  end
end
