class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def blog
    redirect_to "https://test-redirection-fev.herokuapp.com/blog#{request.fullpath.gsub('/blog','')}", :status => :moved_permanently
  end
end
