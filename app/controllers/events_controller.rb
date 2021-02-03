class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    user = User.find(session[:user_id])
    event = Event.new(event_params)
    event.creator = user
    if event.save
      redirect_to root_url, notice: 'Event created successfully'
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:name, :body, :location, :date)
  end
end
