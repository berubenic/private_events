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
    event.build_creator(id: user.id, name: user.name)

    redirect_to root_url, notice: 'Event created successfully' if event.save
  end

  def show; end

  private

  def event_params
    params.require(:event).permit(:name, :body, :location, :date)
  end
end
