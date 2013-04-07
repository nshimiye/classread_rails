class Course
  include Mongoid::Document
  
  #only course has assignments (sorry for misspelling)
  embeds_many :assignement
  
  has_many :lecture
  has_many :user
  has_many :upload
  
  field :name, type: String
  field :descript, type: String
  field :schedule, type: String
  field :start_date, type: Time
  field :end_date, type: Datatime
end
