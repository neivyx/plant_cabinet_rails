class PlantsController < ApplicationController


    def new
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
          @plant = @user.plants.build
        else
          @plant = Plant.new
        end
        @plant.build_category
      end

    def index
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
           @plants = @user.plants.alpha
        else
          @error = "That user doesn't exist" if params[:user_id]
          @plants = Plant.alpha.includes(:category, :user)
        end
    
       
    end
    




end
