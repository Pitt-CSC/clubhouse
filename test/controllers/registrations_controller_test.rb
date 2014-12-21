require 'test_helper'

class RegistrationsControllerTest < ActionController::TestCase
  setup do
    @club = clubs(:pitt_csc)
  end

  test 'new' do
    get :new, club_slug: @club.slug

    assert_response :success
    assert assigns(:member).new_record?
    assert_equal @club, assigns(:member).club
  end

  test 'create' do
    assert_difference -> { @club.members.count } do
      post :create, club_slug: @club.slug, member: { full_name: 'Annie Stamm' }
    end
    assert_response :success
    assert_equal 'Annie Stamm', @club.members.last.full_name
  end
end
