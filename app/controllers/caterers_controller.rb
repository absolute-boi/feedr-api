class CaterersController < ApplicationController
  before_action :set_caterer, only: %i[show]

  def index
    query = Caterer.near(search_params[:coordinates], search_params[:order_type])

    if index_params[:limit].present? && index_params[:page].present?
      query = query.limit(index_params[:limit].to_i).offset(index_params[:page].to_i)
    end

    render json: query.as_json, status: :ok
  end

  def show; end

  def create
    @caterer = Caterer.new(caterer_params)

    if @caterer.save
      render :show, status: :created, location: @caterer
    else
      render json: @caterer.errors, status: :unprocessable_entity
    end
  end

  def update
    if @caterer.update(caterer_params)
      render :show, status: :ok, location: @caterer
    else
      render json: @caterer.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @caterer.destroy
  end

  private

  def set_caterer
    @caterer = Caterer.find(params[:slug])
  end

  def search_params
    {
      coordinates: [index_params[:lat], index_params[:lon]],
      order_type: "radius_#{index_params[:order_type]}".parameterize.to_sym
    }
  end

  def show_params
    params.permit %i[slug]
  end

  def index_params
    params.permit CaterersRepository::INDEX_PARAMS
  end
end
