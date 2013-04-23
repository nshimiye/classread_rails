class User
  #  has_secure_password 
  include Mongoid::Document
  include ActiveModel::SecurePassword

  # can attend many lectures and courses
  has_and_belongs_to_many :lecture
  has_and_belongs_to_many :course  
  
  field :fname, type: String
  field :lname, type: String
  field :email, type: String
  field :username, type: String
    # this status can be student, Teaching Assistant, or Teacher
  field :status, type: String
  
  field :password_digest, type: String
   
  has_secure_password 
  attr_accessor :password_confirmation
  validates_uniqueness_of :email, :username
  validates_presence_of :password, :on => :create

end
