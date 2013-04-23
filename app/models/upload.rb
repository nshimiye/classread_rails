class Upload
  include Mongoid::Document

  #possible to be embedded
  belongs_to :course

  #polymorphic
  belongs_to :file_present, polymorphic: true

  field :file_name, type: String
  field :up_time, type: DateTime

  #this is any of: assignment, lecture notes, announcment, other
  field :status, type: String
end
