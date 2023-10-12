class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :helicopter, null: false, foreign_key: true
      t.string :city, null: false
      t.date :date, null: false
      t.string :status
      

      t.timestamps
    end
  end
end
