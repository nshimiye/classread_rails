class Lecture
  include Mongoid::Document


  # seems redundant, but let's keep it
  has_and_belongs_to_many :user
  belongs_to :course
  
  # polymorphic association
  has_many :uploads, as: :file_present
  
  field :lec_title, type: String
  field :place, type: String
  field :room, type: String
  field :start_time, type: DateTime
  field :end_time, type: DateTime
end
