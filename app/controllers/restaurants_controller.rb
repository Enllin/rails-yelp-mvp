class RestaurantsController < ApplicationController
  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.valid?
      @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      redirect_back(fallback_location: new)
    end
    # No need for app/views/restaurants/create.html.erb
  end

  def new
    @restaurant = Restaurant.new # Needed to instantiate the form_with
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def index
    @restaurants = Restaurant.all
  end

  def reviews
    @reviews = Restaurant.find(params[:id]).reviews
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :category, :phone_number)
  end
end
