module Club::Sluggable
  extend ActiveSupport::Concern

  SLUG_FORMAT = /[a-z0-9_-]+/i

  included do
    validates_presence_of :slug
    validates_format_of :slug, with: /\A#{SLUG_FORMAT}\z/i, allow_blank: true
    validates_uniqueness_of :slug
  end

  def to_param
    slug
  end
end
