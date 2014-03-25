class CreateSpaces < ActiveRecord::Migration
  def change
    create_table :spaces do |t|
      t.references :users
      t.time :start_at
      t.time :end_at

      t.timestamps
    end
  end
end
