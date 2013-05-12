class Course
  include Mongoid::Document
  
  #only course has assignments (sorry for misspelling)
  embeds_many :assignment

  has_and_belongs_to_many :user
  has_many :lectures

  #polymorphic
  has_many :uploads, :as => :file_present

  field :cnumber, type: BigDecimal
  field :cname, type: String
  field :cschedule, type: String
  field :cplace, type: String
  field :croom, type: String
  field :description, type: String
  field :start_date, type: DateTime
  field :end_date, type: DateTime
end
