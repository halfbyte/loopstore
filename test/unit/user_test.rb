require 'test_helper'

class UserTest < ActiveSupport::TestCase

  context "validations" do
    setup do
      Factory(:user)
    end
    should_validate_presence_of :nickname
    should_validate_uniqueness_of :nickname

  end

  context "should create maildrops on create" do


    setup do
      @user = User.create(:email => 'jan@krutisch.de', :password => 'password', :password => 'password', :nickname => 'funkspectah')
    end

    should "set maildrops" do
      assert_not_nil @user.reload.mail_drop_private
      assert_not_nil @user.reload.mail_drop_public
    end
  end
end
