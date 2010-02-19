require 'test_helper'

class LoopsControllerTest < ActionController::TestCase
  context "anyone" do
    setup do
      @user = Factory(:email_confirmed_user)
      @loop = Factory(:loop, :user => @user)
    end
    should "should get index" do
      get :index, :user_id => @user.to_param
      assert_response :success
      assert_not_nil assigns(:loops)
    end

    should "should show loop" do
      get :show, :user_id => @user.to_param, :id => @loop
      assert_response :success
    end
  end
  context "owner" do
    setup do
      @user = Factory(:email_confirmed_user)
      @loop = Factory(:loop, :user => @user)
      sign_in_as(@user)
    end
    should "should get edit" do
      get :edit, :id => @loop.to_param
      assert_response :success
    end

    should "should update loop" do
      put :update, :id => @loop.to_param, :loop => { }
      assert_redirected_to loop_path(assigns(:loop))
    end

    should "should destroy loop" do
      assert_difference('Loop.count', -1) do
        delete :destroy, :id => @loop.to_param
      end

      assert_redirected_to loops_path
    end
  end


end
