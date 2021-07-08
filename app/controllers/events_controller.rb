class EventsController < ApplicationController
  include EventsHelper
  before_action :authenticate_user!

  def index
    @events = Event.all
  end

  def all_events
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @search = params["search"]
    if @search.present?
      @searched_name = @search["name"].split(/\W+/)
      @users = User.where("first_name LIKE ? OR last_name LIKE ?", "#{@searched_name[0]}", "#{@searched_name[1]}")
    end
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
      @event.attendees << current_user
      redirect_to @event
    else
      flash[:alert] = "Error in organizing event! Check the date and if there are any empty fields."
      render 'new'
    end
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    flash[:notice] = "'#{@event.name}' was successfully edited."
    redirect_to @event
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:notice] = "You have successfully canceled '#{@event.name}'."
    redirect_to events_path
  end

  def presence_in
    @event = Event.find(params[:id])
    if @event.attendees.include?(current_user)
      flash[:alert] = "Your presence in '#{@event.name}' was canceled!"
      @event.attendees.delete(current_user)
    else
      flash[:notice] = "Your presence in '#{@event.name}' is confirmed!"
      @event.invited_users.delete(current_user)
      @event.attendees << current_user
    end
    redirect_to all_events_path
  end

  def send_invite
    @event = Event.find(params[:id])
    @invited_user = User.find(params[:invited_user_id])
    if @event.invited_users.include?(@invited_user)
      flash[:alert] = "'#{@invited_user.name}' has already accepted the invitation!"
    else
      flash[:notice] = "'#{@invited_user.name}' invited!"
      @event.invited_users << @invited_user
    end
    redirect_to @event
  end
end
