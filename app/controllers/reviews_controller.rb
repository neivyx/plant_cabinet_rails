class ReviewsController < ApplicationController

    def index

       if params[:plant_id] && @plant = Plant.find_by_id(params[:plant_id])
        # @plant = Plant.find(params[:plant_id])
        @reviews = @plant.reviews
       else
        @review = Review.all
      end
    end
      def show
        @review = Review.find(params[:id])
      end
      def new
        @plant = Plant.find_by_id(params[:plant_id])
        @review = Review.new
      end

      def edit
        @review = Review.find(params[:id])
      end
      def update
        @review = Review.find(params[:id])
        if @review.update(review_params)
          redirect_to plant_reviews_path(@review.plant)
        else
          render :edit
        end
      end
      def create
        @review = current_user.reviews.build(**review_params, plant_id: params[:plant_id])
        if @review.save
          redirect_to redirect_to plant_reviews_path(@review.plant), notice: "Review successfully created."
        else
          render :new
        end
      end
      
      private
      def review_params
        params.require(:review).permit(:rating, :plant_id, plant_attributes:[:name])
    
      end
  

end
