module EventsHelper
  def event_params
    params.require(:event).permit(:name, :location, :date, :desc, :private, :user_id)
  end

  def create_invitation(user, event)
    @invitation = Invitation.new
    @invitation.attendee = user
    @invitation.attended_event = event
    @invitation.save
  end
end
