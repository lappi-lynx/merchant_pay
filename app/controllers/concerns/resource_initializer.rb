module ResourceInitializer
  extend ActiveSupport::Concern

  def after_sign_in_path_for(resource)
    root_for_user(resource)
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

  private

  def root_for_user(resource)
    if resource.admin?
      merchants_path
    elsif resource.merchant?
      merchant_path(resource)
    end
  end
end
