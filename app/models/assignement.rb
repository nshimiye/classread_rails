class Assignement
  include Mongoid::Document
  
  #can be found through a course
  embedded_in :course
  
  #has_many :uploads
  
  field :Ass_number, type: String
  field :post_date, type: Time
  field :dealine, type: Time
  field :status, type: String
  
end
