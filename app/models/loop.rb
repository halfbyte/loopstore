require 'base64'
require 'tmpdir'

class Loop < ActiveRecord::Base
  belongs_to :user
  has_attached_file :nan

  validates_presence_of :name, :message_id
  validates_uniqueness_of :message_id

  named_scope :public, :conditions => { :public => true }
  named_scope :latest, :limit => 10, :order => 'created_at DESC'

  def data=(data)
    unless data.blank?
      f = Paperclip::Tempfile.open(name)
      raw_data = Base64.decode64(data.gsub(/^nanoloop:\/\//,'').gsub(/\-/, '+').gsub(/_/,'/'))
      f.write(raw_data)
      self.nan = f
    end
  end

  def data
    return nil unless nan.file?
    raw_data = open(nan.path).read
    logger.debug(Base64.encode64(raw_data)[0,100])
    "nanoloop://" + Base64.encode64(raw_data).gsub(/\+/, '-').gsub(/\//, '_').gsub(/\n/,'').gsub(/ /,'')
  end
end
