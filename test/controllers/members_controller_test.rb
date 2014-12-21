require 'test_helper'

class MembersControllerTest < ActionController::TestCase
  setup do
    @club = clubs(:pitt_csc)
    @member = members(:ross)
  end

  test 'index' do
    get :index, club_slug: @club.slug

    assert_response :success
    assert_equal @club.members, assigns(:members)
  end

  test 'new' do
    get :new, club_slug: @club.slug

    assert_response :success
    assert assigns(:member).new_record?
    assert_equal @club, assigns(:member).club
  end

  test 'create' do
    assert_difference -> { @club.members.count } do
      post :create, club_slug: @club.slug, member: { first_name: 'Hollis', last_name: 'Murphy' }
    end
    assert_redirected_to club_members_url(@club)
    assert_equal 'Hollis', @club.members.last.first_name
    assert_equal 'Murphy', @club.members.last.last_name
  end

  test 'edit' do
    get :edit, club_slug: @club.slug, id: @member.id

    assert_response :success
    assert_equal @member, assigns(:member)
  end

  test 'update' do
    put :update, club_slug: @club.slug, id: @member.id, member: { last_name: 'Bednar' }

    assert_redirected_to club_members_url(@club)
    assert_equal 'Bednar', @member.reload.last_name
  end

  test 'destroy' do
    assert_difference -> { @club.members.count }, -1 do
      delete :destroy, club_slug: @club.slug, id: @member.id
    end
    assert_redirected_to club_members_url(@club)
    assert_not Member.find_by_id(@member.id)
  end
end
