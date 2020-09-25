class CreatePlants < ActiveRecord::Migration[6.0]
  def change
    create_table :plants do |t|
      t.string :name
      t.string :description
      t.string :location
      t.string :light_requirement
      t.string :watering
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
