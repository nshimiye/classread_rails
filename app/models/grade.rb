class Grade
  include Mongoid::Document

  belongs_to :user
  belongs_to :course

  field :gpa, type: BigDecimal

end
