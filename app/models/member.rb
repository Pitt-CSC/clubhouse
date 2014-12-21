class Member < ActiveRecord::Base
  include Nameable

  belongs_to :club, required: true
end
