class Lecture
  include Mongoid::Document
  
  #seems redundant, but let's keep it
  has_and_belongs_to_many :user
  belongs_to :course
 
  #polymorphic association
  has_many :uploads, as: :file_present
 
  field :held_date, type: Date
  field :start_time, type: Time
  field :end_time, type: Time
end
