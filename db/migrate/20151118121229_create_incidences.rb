class CreateIncidences < ActiveRecord::Migration
  def change
    create_table :incidences do |t|
      t.string :body
      t.references :reservation, index: true

      t.timestamps
    end
  end
end
