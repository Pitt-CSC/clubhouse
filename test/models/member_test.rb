require 'test_helper'

class MemberTest < ActiveSupport::TestCase
  setup do
    @member = members(:ross)
  end

  test 'requires club' do
    assert @member.valid?

    @member.club = nil
    assert @member.invalid?
  end
end
