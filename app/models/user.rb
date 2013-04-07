class User
  include Mongoid::Document
  
  belongs_to :course
  has_many :lecture
  
  field :lname, type: String
  field :fname, type: String
  field :email, type: String
  
  #any of: teacher, ta, student
  field :status, type: String
end
