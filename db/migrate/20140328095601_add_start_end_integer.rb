class AddStartEndInteger < ActiveRecord::Migration
  def change
  	remove_column :spaces, :start_at, :time
  	remove_column :spaces, :end_at, :time
  	add_column :spaces, :start_at, :integer
  	add_column :spaces, :end_at, :integer
  end
end
