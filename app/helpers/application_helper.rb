# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def nanoloop_url(loop)
    "nanoloop://#{loop.data}"
  end
end
