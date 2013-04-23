class Assignement
  include Mongoid::Document
  
  #need to contain course_id
  belongs_to :course
  
  #has_many :uploads
  
  field :Ass_number, type: String
  field :post_date, type: Time
  field :dealine, type: Time
  field :status, type: String
  
end
