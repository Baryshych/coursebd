class CreateLecturers < ActiveRecord::Migration
  def change
    create_table :lecturers do |t|
      t.string :name, null: false
      t.string :surname
      t.string :fname 
      t.timestamps null: false
      t.text :works
      t.text :recomendations
      t.text :projects
    end
  add_reference :subjects, :lecturers, index: true
  end
end
