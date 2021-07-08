class InvitationsController < ApplicationController
  def index
    @events = Event.all
    @invitations_events = []
    @user_invitations = current_user.invitations
    @user_invitations.each do |invitation|
      @invitations_events << invitation.invited_event_id
    end
  end

  def accept
    @event = Event.find(params[:id])
    @event.invited_users.delete(current_user)
    flash[:notice] = "Your presence in '#{@event.name}' is confirmed!"
    @event.attendees << current_user
    redirect_to all_events_path
  end

  def refuse
    @event = Event.find(params[:id])
    @event.invited_users.delete(current_user)
    flash[:alert] = "You have ignored the invitation to '#{@event.name}'."
    redirect_to all_events_path
  end
end
