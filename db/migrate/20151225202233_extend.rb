class Extend < ActiveRecord::Migration
  def change
    add_column :students, :achievments, :text
    add_column :students, :projects, :text
    add_column :students, :about, :text
    add_column :students, :adress, :string
  end
end
