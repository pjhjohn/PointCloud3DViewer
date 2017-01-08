class CreatePointClouds < ActiveRecord::Migration
  def change
    create_table :point_clouds do |t|
      t.string :name
      t.string :data

      t.timestamps null: false
    end
  end
end
