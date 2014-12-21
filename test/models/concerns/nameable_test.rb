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
    assert Person.new.invalid?
  end

  test 'determines full name with first and last names' do
    assert_equal 'Victor Barnes', Person.new(first_name: 'Victor', last_name: 'Barnes').full_name
  end

  test 'determines full name with only first name' do
    assert_equal 'Tyler', Person.new(first_name: 'Tyler').full_name
  end

  test 'populates first and last names from full name with one part' do
    Person.new(full_name: 'Tyler') do |person|
      assert_equal 'Tyler', person.first_name
      assert_equal '', person.last_name
    end
  end

  test 'populates first and last names from full name with two parts' do
    Person.new(full_name: 'Victor Barnes') do |person|
      assert_equal 'Victor', person.first_name
      assert_equal 'Barnes', person.last_name
    end
  end

  test 'populates first and last names from full name with three parts' do
    Person.new(full_name: 'Jessica Rabin Fiske') do |person|
      assert_equal 'Jessica', person.first_name
      assert_equal 'Rabin Fiske', person.last_name
    end
  end

  test 'populates first and last names from full name with one part and irregular spacing' do
    Person.new(full_name: '  Tanya ') do |person|
      assert_equal 'Tanya', person.first_name
      assert_equal '', person.last_name
    end
  end

  test 'populates first and last names from full name with two parts and irregular spacing' do
    Person.new(full_name: ' Rashid   Thomas ') do |person|
      assert_equal 'Rashid', person.first_name
      assert_equal 'Thomas', person.last_name
    end
  end
end
