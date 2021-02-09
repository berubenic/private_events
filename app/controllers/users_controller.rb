class UsersController < ApplicationController
  before_action :require_logout, only: [:new]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        flash[:success] = "#{@user.name} has been created successfully"
        format.html { redirect_to login_url }
      else
        format.html { render :new }
      end
    end
  end

  def show
    respond_to do |format|
      if signed_in? && User.find_by_id(session[:user_id])
        @user = User.find_by_id(session[:user_id])
        @hosted_events = @user.events.upcoming
        @past_events = @user.attended_events.past
        @upcoming_events = @user.attended_events.upcoming
        format.html { @user }
      else
        flash[:alert] = 'You must be signed in'
        format.html { redirect_to login_url }
      end
    end
  end

  def send_invitation
    user = User.find(params[:user])
    event = Event.find(params[:event])
    begin
      user.pending_events << event
    rescue StandardError
      flash[:error] = 'Can not send invitation to this user'
      redirect_to event
    else
      flash[:success] = 'Invite sent sucessfully'
      redirect_to event
    end
  end

  def accept_invitation
    user = User.find(params[:user])
    event = Event.find(params[:event])
    invite = Invitation.find_by(user_id: user.id, event_id: event.id)
    invite.status = 1
    if invite.save
      flash[:success] = 'Invite accepted'
      redirect_to root_url
    else
      flash[:error] = 'Something went wrong'
      redirect_to root_url
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
