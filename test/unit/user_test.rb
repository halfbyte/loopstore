require 'test_helper'

class UserTest < ActiveSupport::TestCase
  context "should create maildrops on create" do
    setup do
      @user = User.create(:email => 'jan@krutisch.de', :password => 'password', :password => 'password')
    end

    should "set maildrops" do
      assert_not_nil @user.reload.mail_drop_private
      assert_not_nil @user.reload.mail_drop_public
    end
  end
end
