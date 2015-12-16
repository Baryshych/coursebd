class Test < ActiveRecord::Migration
  def change
      create_table :marks do |t|
    	t.references :student
    	t.integer :semester, null: false, default: 1
    	t.integer :points, null: false, default: 0
    	t.string :subject, null: false
    	t.string :professor, nul: false
      t.timestamps null: false
    end
  end
end
