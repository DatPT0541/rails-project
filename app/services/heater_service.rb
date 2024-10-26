class HeaterService
  def initialize temperature
    @temperature = temperature
  end

  def turn_on
    Rails.logger.debug "Heater turned on at
      #{@temperature.to_celsius.round(2)}
      °C (#{@temperature.to_kelvin.round(2)}K)"
  end
end
