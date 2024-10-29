class ThermostatsController < ApplicationController
  MAX_TEMPERATURE = 298.15

  def adjust
    temp = Temperature.new(params[:degrees], params[:scale])

    if temp.to_kelvin < MAX_TEMPERATURE
      HeaterService.new(temp).turn_on
      render json: {status: "Heater turned on at #{temp.to_celsius.round(2)}°C"}
    else
      render json: {status: "Temperature is sufficient, heater remains off"}
    end
  end
end
