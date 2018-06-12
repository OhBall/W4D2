class CatRentalRequestsController < ApplicationController
  def index
    @cat_rental_requests = CatRentalRequest.all
    render :index
  end

  def show
    @cat_rental_request = CatRentalRequest.find(params[:id])

    render :show
  end

  def new
    @cat_rental_request = CatRentalRequest.new
    @cats = Cat.all
    render :new
  end

  def create
    cat_rental_request = CatRentalRequest.new(strong_params)
    cat_rental_request.status = "PENDING"
    if cat_rental_request.save
      redirect_to cat_rental_request_url(cat_rental_request)
    else
      render json: cat_rental_request.errors.full_messages, status: :unprocessable_entity
    end
  end

  def edit
    @cat_rental_request = CatRentalRequest.find(params[:id])
    render :edit
  end

  def update
    cat_rental_request = CatRentalRequest.find(params[:id])
    if cat_rental_request.update(strong_params)
      redirect_to cat_rental_request_url(cat_rental_request)
    else
      render json: cat_rental_request.errors.full_messages, status: 422
    end
  end

  private

  def strong_params
    params.require(:cat_rental_request).permit(:start_date, :end_date, :cat_id)
  end



end
