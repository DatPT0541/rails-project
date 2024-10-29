class CheckoutService
  def initialize params
    @params = params
  end

  def call
    Stripe::Charge.create(
      customer: create_customer.id,
      amount: (@params[:amount].to_f * 100).to_i,
      currency: "usd",
      description: @params[:description]
    )
  rescue Stripe::CardError => e
    OpenStruct.new(success?: false, error: e.message)
  else
    OpenStruct.new(success?: true)
  end

  private

  def create_customer
    Stripe::Customer.create(email: @params[:email], source: @params[:source])
  end
end
