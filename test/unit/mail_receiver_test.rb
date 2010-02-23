require 'test_helper'

class MailReceiverTest < ActionMailer::TestCase

  context "receiving a valid mail to private drop" do
    setup do
      @user = Factory(:user, :mail_drop_private => "u051i9j0", :mail_drop_public => "u194920d")
      User.stubs(:find_by_id).returns(@user)
    end
    should "should create loop" do
      assert_difference "Loop.count" do
        MailReceiver.receive(mail_fixture("nanoloop"))
      end
    end
  end

end
