class InvitationsController < ApplicationController
  def index
    @events = Event.all
    @invitations_events = []
    @user_invitations = current_user.invitations
    @user_invitations.each do |invitation|
      @invitations_events << invitation.attended_event_id
    end
  end
end
