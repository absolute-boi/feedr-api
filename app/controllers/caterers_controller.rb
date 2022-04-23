class CaterersController < ApplicationController
  before_action :set_caterer, only: %i[ show update destroy ]

  # GET /caterers
  # GET /caterers.json
  def index
    @caterers = Caterer.all
  end

  # GET /caterers/1
  # GET /caterers/1.json
  def show
  end

  # POST /caterers
  # POST /caterers.json
  def create
    @caterer = Caterer.new(caterer_params)

    if @caterer.save
      render :show, status: :created, location: @caterer
    else
      render json: @caterer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /caterers/1
  # PATCH/PUT /caterers/1.json
  def update
    if @caterer.update(caterer_params)
      render :show, status: :ok, location: @caterer
    else
      render json: @caterer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /caterers/1
  # DELETE /caterers/1.json
  def destroy
    @caterer.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_caterer
      @caterer = Caterer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def caterer_params
      params.fetch(:caterer, {})
    end
end
