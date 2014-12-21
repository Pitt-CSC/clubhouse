module Club::Sluggable
  extend ActiveSupport::Concern

  SLUG_FORMAT = /\A[a-z0-9_-]+\z/i

  included do
    validates_presence_of :slug
    validates_format_of :slug, with: SLUG_FORMAT, allow_blank: true
    validates_uniqueness_of :slug
  end
end
