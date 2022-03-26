class CreateUserShares < ActiveRecord::Migration[7.0]
  def change
    create_table :user_shares do |t|
      t.references :user, null: false, foreign_key: true
      t.references :user_share, null: false, foreign_key: { to_table: "users" }
      t.datetime :end_date
      t.integer :status, default: 1
      t.boolean :medical_appointment, default: false
      t.boolean :exam, default: false
      t.boolean :treatment, default: false

      t.timestamps
    end
  end
end
