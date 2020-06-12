# frozen_string_literal: true

class BaseForm < Reform::Form
  def initialize(model, as: nil)
    super(model)
    @current_user = as
  end

  def validate(params = {})
    super
    errors.empty?
  end

  def validate_and_save!(params = {})
    validate(params).tap { |is_valid| save if is_valid }
  end

  def errors_data(params = {})
    @errors_data&.merge!(params) || (@errors_data = params)
  end

  private

  attr_reader :current_user
end
