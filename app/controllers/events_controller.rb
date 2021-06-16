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
      redirect_to @event
    else
      flash[:alert] = "Error in organizing event!"
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
    @event.delete
    flash[:notice] = "You have successfully canceled this event."
    redirect_to events_path
  end
end
