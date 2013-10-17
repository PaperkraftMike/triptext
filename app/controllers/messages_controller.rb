class MessagesController < ApplicationController
  # before_action :set_message, only: [:show, :edit, :update, :destroy]
  respond_to :json

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params)
    @message.save
    respond_with(@message)
  end

  private

    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:ip_address, :phone_number, :drive_time, :text)
    end
end
