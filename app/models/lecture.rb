class Lecture
  include Mongoid::Document
  
  #seems redundant, but let's keep it
  belongs_to :user
  belongs_to :course
  
  field :held_date, type: Date
  field :start_time, type: Time
  field :end_time, type: Time
end
