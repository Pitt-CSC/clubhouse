class Club < ActiveRecord::Base
  include Sluggable

  has_many :members, dependent: :destroy

  validates_presence_of :name
end
