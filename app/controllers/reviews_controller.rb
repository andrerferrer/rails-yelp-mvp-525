# frozen_string_literal: true

class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    @review = Review.new(strong_params)

    # find the restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
    # associate the review with the restaurant
    @review.restaurant = @restaurant

    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  private

  def strong_params
    params.require(:review)
          .permit(:content, :rating)
  end
end
