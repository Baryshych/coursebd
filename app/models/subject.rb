class Subject < ActiveRecord::Base
    has_many :marks
    belongs_to :lecturer
end
