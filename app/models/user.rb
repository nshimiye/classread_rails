class User
  include Mongoid::Document
  
  has_and_belongs_to_many :course
  has_many :lecture
  
  field :lname, type: String
  field :fname, type: String
  field :email, type: String
  
  #any of: teacher, ta, student
  field :status, type: String

  #specify fields accessible for the user
  #attr_accessible :lname, :fname, :email #:password, :password_confirmation
end
