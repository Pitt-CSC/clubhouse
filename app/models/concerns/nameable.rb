module Nameable
  extend ActiveSupport::Concern

  included do
    validates_presence_of :first_name
  end

  def full_name
    [first_name, last_name.presence].compact.join(' ')
  end
end
