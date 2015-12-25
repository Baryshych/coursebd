class AddingPaperclip < ActiveRecord::Migration
  def change
    drop_table :nifty_attachments
    add_attachment :students, :image  
  end
end
