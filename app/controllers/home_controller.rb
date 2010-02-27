class HomeController < ApplicationController

  def index
    @latest_public = Loop.public.all(:limit => 10)
  end


end
