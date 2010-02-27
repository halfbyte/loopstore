class User < ActiveRecord::Base
  include Clearance::User
  after_create :ensure_maildrops
  has_many :loops

  validates_presence_of :nickname
  validates_uniqueness_of :nickname


  def ensure_maildrops
    if (mail_drop_public.blank? || mail_drop_private.blank?)
      regenerate_emails
    end
    true
  end

  def regenerate_emails
    self.update_attributes(:mail_drop_public => new_maildrop, :mail_drop_private => new_maildrop)
  end

  def new_maildrop
    voc = "aeijouy"
    con = "bcdfghjklmnpqrstvwxz"
    num = "0123456789"
    (0..7).to_a.map { |i|
      if rand() > 0.7
        num[(rand() * num.size).to_i,1]
      else
        if i % 2 == 0
          voc[(rand() * voc.size).to_i,1]
        else
          num[(rand() * num.size).to_i,1]
        end
      end
    }.join
  end

end
