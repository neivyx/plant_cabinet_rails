module PlantsHelper


    def display_plants
        if @user.plants.empty?
          tag.h2(link_to('No Plants yet - create a plant here', new_plant_path))
        else
          user = @user == current_user ? 'Your' : "#{@user.name}'s"
          review_tag(:h2, "#{user} #{pluralize(@user.plants.count, 'Plant')}:")
    
        end
      end
end
