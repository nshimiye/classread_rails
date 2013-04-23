class Assignment
  include Mongoid::Document

  #need to contain course_id
  belongs_to :course

  #has_many :uploads

  field :ass_number, type: String
  field :post_date, type: DateTime
  field :deadline, type: DateTime
  
  #this status can be posted, pending, canceled, or closed
  field :status, type: String
end
