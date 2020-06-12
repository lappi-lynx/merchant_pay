class MerchantsController < ApplicationController
  before_action :set_merchant, only: %i[show edit update destroy]

  def index
    @merchants = Merchant.all.includes(:transactions)
  end

  def update
    if @merchant.update(merchant_params)
      redirect_to @merchant, notice: 'Merchant was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @merchant.destroy

    redirect_to merchants_url, notice: 'Merchant was successfully destroyed.'
  end

  private

  def set_merchant
    @merchant = Merchant.find(params[:id])
  end

  def merchant_params
    params.fetch(:merchant).permit(:name, :description, :status, :email)
  end
end
