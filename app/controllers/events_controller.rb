class EventsController < ApplicationController
  before_action :require_signed_in
  def index
    @past_events = Event.all.past
    @upcoming_events = Event.all.upcoming
  end

  def new
    @event = Event.new
  end

  def create
    user = User.find(session[:user_id])
    @event = Event.new(event_params)
    @event.creator = user
    if @event.save
      flash[:success] = 'Event created successfully'
      redirect_to root_url
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
    @users = User.where.not(id: session[:user_id])
  end

  def destroy
    event = Event.find(params[:id])
    if event.destroy!
      flash[:success] = 'Event successfully deleted'
      redirect_to root_url
    else
      flash[:error] = 'Something went wrong'
      redirect_to event_url(event.id)
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :body, :location, :date)
  end
end
