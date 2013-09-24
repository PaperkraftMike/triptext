class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  respond_to :json


  # GET /messages
  # GET /messages.json
  def index
    redirect_to root_path
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
    redirect_to root_path
  end

  # GET /messages/new
  def new
    redirect_to root_path
  end

  # GET /messages/1/edit
  def edit
    redirect_to root_path
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params)
    if @message.save
      @message.dispatch_on = @message.created_at + @message.drive_time
      @message.save
      @message.create_number
    end
    respond_with(@message)
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    redirect_to root_path
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    redirect_to root_path
  end

  private

    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:category, :dispatch_on, :ip_address, :text, :user_id, :number_id, :address_id, :phone_number, :drive_time)
    end
end
