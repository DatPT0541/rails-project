class ChargesController < ApplicationController
  def create
    result = CheckoutService.new(params).call
    if result.success?
      redirect_to charges_path
    else
      flash[:error] = result.error
      redirect_to new_charge_path
    end
  end

  # def create
  #   interactor = CheckoutInteractor.call params
  #   if interactor.success?
  #     redirect_to charges_path
  #   else
  #     flash[:error] = interactor.error
  #     redirect_to new_charge_path
  #   end
  # end
end
