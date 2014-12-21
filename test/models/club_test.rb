require 'test_helper'

class OrganizationTest < ActiveSupport::TestCase
  setup do
    @club = clubs(:pitt_csc)
  end

  test 'requires name' do
    assert @club.valid?

    @club.name = ''
    assert @club.invalid?
  end

  test 'requires slug' do
    assert @club.valid?

    @club.slug = ''
    assert @club.invalid?
  end

  test 'requires unique slug' do
    other_club = clubs(:pitt_wics)
    assert other_club.valid?

    other_club.slug = @club.slug
    assert other_club.invalid?
  end

  test 'requires properly formatted slug' do
    assert @club.valid?

    ['  pitt csc ', 'pittc$c', 'pittcsc☃'].each do |invalid_slug|
      @club.slug = invalid_slug
      assert @club.invalid?
    end
  end

  test 'uses slug as parameter' do
    assert_equal @club.slug, @club.to_param
  end
end
