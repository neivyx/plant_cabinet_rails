class PlantsController < ApplicationController


    def new
     @plant = Plant.new

      end

    def create
     @plant = current_user.plants.build(plant_params)
     if @plant.save
        redirect_to @plant
     else
        render :new
     end
    end

    def show
        redirect_to plants_path if !@plant
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
