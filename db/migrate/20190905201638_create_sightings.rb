class CreateSightings < ActiveRecord::Migration[5.2]
  def change
    create_table :sightings do |t|
      t.references :dinosaur, foreign_key: true
      t.datetime :date
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
