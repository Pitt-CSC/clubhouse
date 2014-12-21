class Member < ActiveRecord::Base
  belongs_to :club, required: true

  validates_presence_of :first_name
end
