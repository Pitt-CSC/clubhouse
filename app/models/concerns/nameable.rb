module Nameable
  extend ActiveSupport::Concern

  included do
    validates_presence_of :first_name
  end

  def full_name
    [first_name, last_name.presence].compact.join(' ')
  end

  def full_name=(full_name)
    self.first_name, self.last_name = full_name.to_s.strip.split(/\s+/, 2)
  end
end
