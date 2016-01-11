class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :customer
      t.string :incidences
      t.date :date
      t.time :hour
      t.references :space, index: true

      t.timestamps
    end
  end
end
