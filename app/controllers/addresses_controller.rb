class AddressesController < ApplicationController
  before_action :set_address, only: [:show, :edit, :update, :destroy]

  # GET /addresses
  # GET /addresses.json
  def index
    @addresses = Addresses.all
  end

  # GET /addresses/1
  # GET /addresses/1.json
  def show
  end

  # GET /addresses/new
  def new
    @addresses = Addresses.new
  end

  # GET /addresses/1/edit
  def edit
  end

  # POST /addresses
  # POST /addresses.json
  def create
    @addresses = Addresses.new(addresses_params)
    respond_to do |format|
      if @addresses.save
        format.html { redirect_to root_path, notice: 'Address was successfully created.' }
        format.json { render action: 'show', status: :created, location: @addresses }
      else
        format.html { render action: 'new' }
        format.json { render json: @addresses.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /addresses/1
  # PATCH/PUT /addresses/1.json
  def update
    respond_to do |format|
      if @addresses.update(addresses_params)
        format.html { redirect_to @address, notice: 'Address was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @addresses.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /addresses/1
  # DELETE /addresses/1.json
  def destroy
    @addresses.destroy
    respond_to do |format|
      format.html { redirect_to addresses_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_address
      @address = Addresses.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def addresses_params
      params.require(:addresses).permit(:zip_code, :state, :lat_long, :city, :street)
    end
end
