class Student < ActiveRecord::Base
     has_many :marks
     has_attached_file :image, styles: { small: "64x64", med: "100x133", large: "300x400" }
     validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
     

def self.search(search)
  if search
    where(['surname LIKE ?', "%#{search}%"])
else
    all
  end
end


end
