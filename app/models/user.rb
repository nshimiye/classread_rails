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
  field :status, type: String, :default => 'student'
  
  field :password_digest, type: String
   
  has_secure_password
  attr_accessor :old_password
  attr_reader :password
  attr_accessible :password, :old_password # ...
  validates_presence_of :password, :on => :create, :message => "Password can't be blank"
  validates_confirmation_of :password

  
  attr_accessible :course_ids, :fname, :lname, :email, :username, :password_confirmation
  validates_presence_of :fname, :lname, :allow_blank => false
  validates_uniqueness_of :username, :email, :allow_blank => false
  validates_format_of :username, :with => /^[-\w\._@]+$/i, :allow_blank => true, :message => "should only contain letters, numbers, or .-_@", :allow_blank => false
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
  validates_length_of :password, :minimum => 1, :allow_blank => true
  validates :password,  :presence => true, 
                            :length   => { :within => 1..40 }, 
                            :confirmation => true, 
                            :if       => :password_changed?
  
  def password_changed?
    (old_password.blank? == false ) or (password_digest.blank? == true)
  end
end
