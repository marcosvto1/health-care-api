class CreateTreatments < ActiveRecord::Migration[7.0]
  def change
    create_table :treatments do |t|
      t.string :title, null: false
      t.text :description
      t.date :date
      t.string :treatment_location
      t.integer :kind
      t.references :medical_appointment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
