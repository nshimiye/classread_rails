#poly interface
class Classfile
  include Mongoid::Document
   
  #polymorphic
  belongs_to :pr, polymorphic: true
  
end
