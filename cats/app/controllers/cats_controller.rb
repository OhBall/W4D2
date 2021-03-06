class CatsController < ApplicationController
  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = Cat.find(params[:id])

    render :show
  end

  def new
    @cat = Cat.new
    render :new
  end

  def create
    cat = Cat.new(strong_params)
    if cat.save
      redirect_to cat_url(cat)
    else
      render json: cat.errors.full_messages, status: :unprocessable_entity
    end
  end

  def edit
    @cat = Cat.find(params[:id])
    render :edit
  end

  def update
    cat = Cat.find(params[:id])
    if cat.update(strong_params)
      redirect_to cat_url(cat)
    else
      render json: cat.errors.full_messages, status: 422
    end
  end

  private

  def strong_params
    params.require(:cat).permit(:description, :birth_date, :sex, :name, :color)
  end
end
