class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    if resource.admin?
      merchants_path
    elsif resource.merchant?
      merchant_path(resource)
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    # TODO: define route constaints for root_url based on current_user role to handle AccessDenien
    render plain: exception, content_type: 'text/plain', status: 403
    # respond_to do |format|
    # format.json { head :forbidden, content_type: 'text/html' }
    # format.html { redirect_to root_url, notice: exception.message }
    # format.js   { head :forbidden, content_type: 'text/html' }
    # end
  end

  protected

  def form_class
    raise NotImplementedError
  end

  def resource_class
    raise NotImplementedError
  end

  def resource_object
    @resource_object ||= resource_class.find(params[:id])
  end

  def form
    @form ||= form_class.new(resource_object)
  end

  def presenter_class
    raise NotImplementedError
  end

  def resource_to_presenter(resource_object)
    presenter_class.new(resource_object)
  end
end
