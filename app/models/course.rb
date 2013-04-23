class Course
  include Mongoid::Document
  
  #only course has assignments (sorry for misspelling)
  embeds_many :assignement
    
  has_and_belongs_to_many :user
  has_many :lectures

  #polymorphic
  has_many :uploads, :as => :file_present
  
  field :name, type: String
  field :descript, type: String
  field :schedule, type: String
  field :start_date, type: Time
  field :end_date, type: DateTime
end
