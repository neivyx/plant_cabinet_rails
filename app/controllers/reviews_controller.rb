class ReviewsController < ApplicationController

    def index
        @plant = Plant.find(params[:plant_id])
        @reviews = @plant.reviews
      end
      def show
        @review = Review.find(params[:id])
      end
      def new
        @plant = Plant.find(params[:plant_id])
        @review = Review.new
      end
  

end
