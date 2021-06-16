class EventsController < ApplicationController
  include EventsHelper
  before_action :authenticate_user!

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def edit
    @event = Event.find(params[:id])
  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      flash[:notice] = "Event '#{@event.name}' created!"
      @invitation = Invitation.new
      @invitation.attendee = current_user
      @invitation.attended_event = @event
      @invitation.save
      redirect_to @event
    else
      flash[:alert] = "Error in organizing event! Check the date and if there are any empty fields."
      render 'new'
    end
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    flash[:notice] = "#{@event.name} was successfully edited."
    redirect_to @event
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:notice] = "You have successfully canceled #{@event.name}."
    redirect_to events_path
  end
end
