module EventsHelper
  def users_available_to_invite
    invited_users = @event.pending_attendees
    declined_users = @event.declined_attendees
    attendees = @event.attendees
    users = User.all
    users.filter_map do |user|
      unless invited_users.include?(user) ||
             declined_users.include?(user) ||
             attendees.include?(user) ||
             @event.creator == user
        user
      end
    end
  end
end
