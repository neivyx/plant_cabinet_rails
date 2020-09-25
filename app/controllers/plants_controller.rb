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
          @plants = Plant.all
    end

    def edit 

    end

    def update
        if @plant.update(plants_params)
            redirect_to plant_path(@plant)
        else
            render :edit
        end

    end


    def destory
        @plant.destory
        redirect_to plants_path
    end
    
   private

   def set_plant
    @plant = Plant.find_by_id(params[:id])

   end

   def plant_params
    params.require(:plant).permit(:name, :description, :location, :light_requirement, :watering, )
   end

end
