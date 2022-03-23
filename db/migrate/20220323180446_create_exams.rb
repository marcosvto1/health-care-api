class CreateExams < ActiveRecord::Migration[7.0]
  def change
    create_table :exams do |t|
      t.string :title, null: false
      t.date :date, null:false
      t.string :exam_location, null: false
      t.references :medical_appointment, null: true, foreign_key: true

      t.timestamps
    end
  end
end
