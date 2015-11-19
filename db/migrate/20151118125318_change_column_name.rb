class ChangeColumnName < ActiveRecord::Migration
  def change
  	rename_column :reservations, :incidences, :problems
  end
end
