class CreateDinosaurs < ActiveRecord::Migration[5.2]
  def change
    create_table :dinosaurs do |t|
      t.string :name
      t.string :suborder
      t.string :order

      t.timestamps
    end
  end
end
