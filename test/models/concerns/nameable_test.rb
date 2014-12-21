require 'test_helper'

class Person
  include ActiveModel::Model
  include Nameable

  attr_accessor :first_name, :last_name
end

class NameableTest < ActiveSupport::TestCase
  test 'requires first name' do
    assert Person.new(first_name: 'Rashid', last_name: 'Thomas').valid?
    assert Person.new(last_name: 'Thomas').invalid?
  end

  test 'determines full name with first and last names' do
    assert_equal 'Victor Barnes', Person.new(first_name: 'Victor', last_name: 'Barnes').full_name
  end

  test 'determines full name with only first name' do
    assert_equal 'Tyler', Person.new(first_name: 'Tyler').full_name
  end
end
