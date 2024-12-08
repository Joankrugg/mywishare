class EventsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_event, only: %i[ show update destroy ]

  # GET /events
  def index
    @events = Event.all

  end

  # GET /events/1
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
    @event.build_organizer
    Starter.all.each do |starter|
      @event.event_starters.build(starter: starter, quantity: 0)
    end
    Dessert.all.each do |dessert|
      @event.event_desserts.build(dessert: dessert, quantity: 0)
    end
  end


  # POST /events

  def create
    organizer_params = event_params[:organizer_attributes]
    @organizer = Organizer.find_or_initialize_by(email: organizer_params[:email])
    @organizer.assign_attributes(organizer_params) # Met à jour ou crée l'organisateur

    @event = Event.new(event_params.except(:organizer_attributes))
    @event.organizer = @organizer

    if @event.save
      redirect_to @event, notice: 'Événement créé avec succès.'
    else
      render :new
    end
  end

  # PATCH/PUT /events/1
  def update
    if @event.update(event_params)
      redirect_to @event, notice: "Event was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /events/1
  def destroy
    @event.destroy!
    redirect_to events_url, notice: "Event was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def event_params
    params.require(:event).permit(:number_of_guests, :arrival, :comment, :share_id, event_starters_attributes: [:id, :starter_id, :quantity, :_destroy], event_desserts_attributes: [:dessert_id, :quantity, :_destroy], organizer_attributes: [:first_name, :last_name, :email, :phone_number])
  end

end

