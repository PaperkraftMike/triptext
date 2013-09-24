class NumbersController < ApplicationController
  before_action :set_number, only: [:show, :edit, :update, :destroy]
  respond_to :json

  # GET /numbers
  # GET /numbers.json
  def index
    redirect_to root_path
  end

  # GET /numbers/1
  # GET /numbers/1.json
  def show
    redirect_to root_path
  end

  # GET /numbers/new
  def new
    redirect_to root_path
  end

  # GET /numbers/1/edit
  def edit
    redirect_to root_path
  end

  # POST /numbers
  # POST /numbers.json
  def create
    @number = Number.new(number_params)
    @number.save
    respond_with(@number)
  end

  # PATCH/PUT /numbers/1
  # PATCH/PUT /numbers/1.json
  def update
    redirect_to root_path
  end

  # DELETE /numbers/1
  # DELETE /numbers/1.json
  def destroy
    redirect_to root_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_number
      @number = Number.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def number_params
      params.require(:number).permit(:user_id, :phone_number, :message_id)
    end
end
