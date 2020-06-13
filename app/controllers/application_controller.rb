class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  protected

  def form_class
    raise NotImplementedError
  end

  def resource_class
    raise NotImplementedError
  end

  def resource
    @resource ||= resource_class.find(params[:id])
  end

  def form
    @form ||= form_class.new(resource)
  end

  def presenter_class
    raise NotImplementedError
  end

  def resource_to_presenter(resource)
    presenter_class.new(resource)
  end
end
