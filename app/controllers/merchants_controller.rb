class MerchantsController < ApplicationController
  load_and_authorize_resource
  before_action :set_merchant, only: %i[show edit update destroy]
  before_action :form, only: %i[edit update]

  def index
    @merchants = Merchant.all.includes(:transactions)
  end

  def update
    if form.validate_and_save!(merchant_params)
      redirect_to resource_object, notice: "#{resource_class} was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @merchant.destroy

    redirect_to merchants_url, notice: "#{resource_class} was successfully destroyed."
  end

  private

  def set_merchant
    @merchant = resource_object
  end

  def form_class
    ::V1::Merchant::BaseForm
  end

  def resource_class
    ::Merchant
  end

  def merchant_params
    params.fetch(:merchant).permit(:name, :description, :status, :email)
  end
end
