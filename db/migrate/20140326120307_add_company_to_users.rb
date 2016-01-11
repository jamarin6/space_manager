class AddCompanyToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :company, :string
  	remove_column :users, :mail
  end
end
