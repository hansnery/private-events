module EventsHelper
  def event_params
    params.require(:event).permit(:name, :location, :date, :desc, :user_id)
  end
end
