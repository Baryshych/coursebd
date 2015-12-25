class Lecturer < ActiveRecord::Base
    has_many :subjects
end
