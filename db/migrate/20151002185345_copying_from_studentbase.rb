class CopyingFromStudentbase < ActiveRecord::Migration
  def change
  	create_table :students do |t|
    	t.string :name, null: false, default: ""
    	t.string :surname, null: false, default: ""
    	t.string :fname, null: false, default: ""
    	t.string :emails, null: false, default: ""
    	t.integer :phone_number, null: false, default: 0
    	t.string :group, null: false, default: ""
    	t.integer :course, null: false, default: 1
    	t.datetime :date_of_birth
      t.timestamps null: false
  end
  end
end
