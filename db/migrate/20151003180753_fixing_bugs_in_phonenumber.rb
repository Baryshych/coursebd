class FixingBugsInPhonenumber < ActiveRecord::Migration
  def change
  	change_column :students, :phone_number, :string
  	change_column :students, :date_of_birth, :string
  	add_column :users, :permissions, :string, default: "observe"

  end
end
