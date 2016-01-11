class AddIntegerToHour < ActiveRecord::Migration
  def change
  	remove_column :reservations, :hour, :time
  	add_column :reservations, :hour, :integer
  end
end
