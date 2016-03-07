class FinancersController < ApplicationController
  before_action :set_financer, only: [:show, :edit, :update, :destroy]

  # GET /financers
  # GET /financers.json
  def index
    @financers = Financer.all
  end

  # GET /financers/1
  # GET /financers/1.json
  def show
  end

  # GET /financers/new
  def new
    @financer = Financer.new
  end

  # GET /financers/1/edit
  def edit
  end

  # POST /financers
  # POST /financers.json
  def create
    @financer = Financer.new(financer_params)

    respond_to do |format|
      if @financer.save
        format.html { redirect_to @financer, notice: 'Financer was successfully created.' }
        format.json { render :show, status: :created, location: @financer }
      else
        format.html { render :new }
        format.json { render json: @financer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /financers/1
  # PATCH/PUT /financers/1.json
  def update
    respond_to do |format|
      if @financer.update(financer_params)
        format.html { redirect_to @financer, notice: 'Financer was successfully updated.' }
        format.json { render :show, status: :ok, location: @financer }
      else
        format.html { render :edit }
        format.json { render json: @financer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /financers/1
  # DELETE /financers/1.json
  def destroy
    @financer.destroy
    respond_to do |format|
      format.html { redirect_to financers_url, notice: 'Financer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_financer
      @financer = Financer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def financer_params
      params.require(:financer).permit(:name)
    end
end
