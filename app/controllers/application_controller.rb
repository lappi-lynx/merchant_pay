class ApplicationController < ActionController::Base
  include ResourceInitializer

  before_action :authenticate_user!

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html', status: 403 }
      format.html { redirect_to root_for_user(current_user), alert: exception.message }
    end
  end
end
