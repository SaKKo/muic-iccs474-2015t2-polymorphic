class MyCustomersController < ApplicationController
  before_action :set_my_customer, only: [:show, :edit, :update, :destroy]

  # GET /my_customers
  # GET /my_customers.json
  def index
    @my_customers = MyCustomer.all
  end

  # GET /my_customers/1
  # GET /my_customers/1.json
  def show
  end

  # GET /my_customers/new
  def new
    @my_customer = MyCustomer.new
    @company = Company.new
    @financer = Financer.new
    @individual = Individual.new
  end

  # GET /my_customers/1/edit
  def edit
    @company = @my_customer.tradeable.class == Company ? @my_customer.tradeable : Company.new
    @financer = @my_customer.tradeable if @my_customer.tradeable.class == Financer
    @financer ||= Financer.new
    @individual = @my_customer.tradeable if @my_customer.tradeable.class == Individual
    @individual ||= Individual.new
  end

  # POST /my_customers
  # POST /my_customers.json
  def create
    saved = false
    begin
      ActiveRecord::Base.transaction do
        @my_customer = MyCustomer.new(my_customer_params)
        if params[:my_customer][:tradeable_type] == "Company"
          @company = Company.new(company_params)
          @company.save!
          @my_customer = @company
        elsif params[:my_customer][:tradeable_type] == "Financer"
          @financer = Financer.new(financer_params)
          @financer.save!
          @my_customer = @financer
        elsif params[:my_customer][:tradeable_type] == "Individual"
          @individual = Individual.new(individual_params)
          @individual.save!
          @my_customer = @individual
        end
        @my_customer.save!
        saved = true
      end
    rescue ActiveRecord::RecordInvalid
    end


    respond_to do |format|
      if saved
        format.html { redirect_to @my_customer, notice: 'My customer was successfully created.' }
        format.json { render :show, status: :created, location: @my_customer }
      else
        format.html { render :new }
        format.json { render json: @my_customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /my_customers/1
  # PATCH/PUT /my_customers/1.json
  def update
    respond_to do |format|
      if @my_customer.update(my_customer_params)
        format.html { redirect_to @my_customer, notice: 'My customer was successfully updated.' }
        format.json { render :show, status: :ok, location: @my_customer }
      else
        format.html { render :edit }
        format.json { render json: @my_customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /my_customers/1
  # DELETE /my_customers/1.json
  def destroy
    @my_customer.destroy
    respond_to do |format|
      format.html { redirect_to my_customers_url, notice: 'My customer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_my_customer
      @my_customer = MyCustomer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def my_customer_params
      params.require(:my_customer).permit(:number)
    end

    def financer_params
      params.require(:financer).permit(:name)
    end

    def individual_params
      params.require(:individual).permit(:first_name, :last_name)
    end

    def company_params
      params.require(:company).permit(:tax_number, :name)
    end
end
