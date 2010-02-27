require 'test_helper'

class LoopTest < ActiveSupport::TestCase
  should_belong_to :user
  should_validate_uniqueness_of :message_id
  should_validate_presence_of :name, :message_id

  context "base64 interface to the nan file" do

    setup do
      @raw = "The Quick Brown Fox jumps over the lazy dog"
      # damn that special nanoloop base64 format
      @encoded = [@raw].pack('m').gsub(/\+/, '-').gsub(/\//, '_').gsub(/\n/,'').gsub(/ /,'')
    end

    should "create file from base64 string" do
      loop = Loop.new(Factory.attributes_for(:loop).merge(:data => @encoded))
      loop.save
      assert loop.nan.file?
      assert_equal @raw, open(loop.nan.path).read
    end
    should "be able to refetch data from file in data attribute" do
      loop = Loop.new(Factory.attributes_for(:loop).merge(:data => @encoded))
      loop.save
      assert_equal "nanoloop://#{@encoded}", loop.data
    end
  end

end
