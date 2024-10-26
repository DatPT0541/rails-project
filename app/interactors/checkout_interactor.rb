class CheckoutInteractor
  def self.call params
    new(params).call
  end

  def initialize params
    @params = params
  end

  def call
    result = CheckoutService.new(@params).call
    OpenStruct.new(success?: result.success?, error: result.error)
  end
end
