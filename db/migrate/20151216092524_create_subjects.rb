class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :name
      t.integer :credit
      t.integer :number_of_hours
      t.timestamps null: false
    end
      remove_column :marks, :subject
      add_reference :marks, :subjects, index: true
  end
end
