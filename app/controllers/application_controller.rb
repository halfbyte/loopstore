# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include Clearance::Authentication
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  before_filter :set_iphone_view
  helper_method :maildrop

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password




protected
  def login_required
    authenticate
  end
  def maildrop(user, priv)
    "loopstore+#{user.id}#{priv ? "P" : "p"}#{priv ? user.mail_drop_private : user.mail_drop_public}@googlemail.com"
  end

  def set_iphone_view
    if iphone_request?
      request.format = :iphone
    end
  end

  def iphone_request?
    (agent = request.env["HTTP_USER_AGENT"]) && agent[/(Mobile\/.+Safari)/]
  end



end
