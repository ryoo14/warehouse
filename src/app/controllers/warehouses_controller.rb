class WarehousesController < ApplicationController
  before_action :set_warehouse, only: %i[ inc dec update destroy ]

  # GET /warehouses or /warehouses.json
  def index
    @warehouses = Warehouse.all
  end

  # GET /warehouses/new
  def new
    @warehouse = Warehouse.new
  end

  # POST /warehouses/1/inc
  def inc
    @warehouse.count += 1
    respond_to do |format|
      if @warehouse.save
        format.html { redirect_to warehouses_url, notice: "Warehouse was successfully created." }
        format.json { render :index, status: :created, location: @warehouse }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @warehouse.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /warehouses/1/dec
  def dec
    @warehouse.count -= 1
    respond_to do |format|
      if @warehouse.save
        format.html { redirect_to warehouses_url, notice: "Warehouse was successfully created." }
        format.json { render :index, status: :created, location: @warehouse }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @warehouse.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /warehouses or /warehouses.json
  def create
    @warehouse = Warehouse.new(warehouse_params)

    respond_to do |format|
      if @warehouse.save
        format.html { redirect_to warehouses_url, notice: "Warehouse was successfully created." }
        format.json { render :index, status: :created, location: @warehouse }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @warehouse.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /warehouses/1 or /warehouses/1.json
  def destroy
    @warehouse.destroy
    respond_to do |format|
      format.html { redirect_to warehouses_url, notice: "Warehouse was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_warehouse
      @warehouse = Warehouse.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def warehouse_params
      params.require(:warehouse).permit(:name, :count, :category)
    end
end
