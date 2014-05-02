class OpenTrucksController < ApplicationController
  before_action :set_open_truck, only: [:show, :edit, :update, :destroy]

  # GET /open_trucks
  # GET /open_trucks.json
  def index
    @open_trucks = OpenTruck.all
  end

  # GET /open_trucks/1
  # GET /open_trucks/1.json
  def show
  end

  # GET /open_trucks/new
  def new
    @open_truck = OpenTruck.new
  end

  # GET /open_trucks/1/edit
  def edit
  end

  # POST /open_trucks
  # POST /open_trucks.json
  def create
    @open_truck = OpenTruck.new(open_truck_params)

    respond_to do |format|
      if @open_truck.save
        format.html { redirect_to @open_truck, notice: 'Open truck was successfully created.' }
        format.json { render :show, status: :created, location: @open_truck }
      else
        format.html { render :new }
        format.json { render json: @open_truck.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /open_trucks/1
  # PATCH/PUT /open_trucks/1.json
  def update
    respond_to do |format|
      if @open_truck.update(open_truck_params)
        format.html { redirect_to @open_truck, notice: 'Open truck was successfully updated.' }
        format.json { render :show, status: :ok, location: @open_truck }
      else
        format.html { render :edit }
        format.json { render json: @open_truck.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /open_trucks/1
  # DELETE /open_trucks/1.json
  def destroy
    @open_truck.destroy
    respond_to do |format|
      format.html { redirect_to open_trucks_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_open_truck
      @open_truck = OpenTruck.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def open_truck_params
      params.require(:open_truck).permit(:truck_id, :openUntil)
    end
end
