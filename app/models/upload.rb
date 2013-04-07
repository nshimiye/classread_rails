class Upload
  include Mongoid::Document
  
  #possible to be embedded
  belongs_to :course
  
  field :file_name, type: String
  field :up_time, type: Time
  
  #this is any of: assignment, lecture notes, announcment, other
  field :type, type: String
end
