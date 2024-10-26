class Temperature
  include Comparable

  SCALES = %w(kelvin celsius fahrenheit).freeze
  DEFAULT_SCALE = "kelvin".freeze

  def initialize degrees, scale = DEFAULT_SCALE
    @degrees = degrees.to_f
    @scale = SCALES.include?(scale) ? scale : DEFAULT_SCALE
    @kelvin_degrees = convert_to_kelvin(@degrees, @scale)
  end

  def to_kelvin # rubocop:disable Style/TrivialAccessors
    @kelvin_degrees
  end

  def to_celsius
    @kelvin_degrees - 273.15
  end

  def to_fahrenheit
    (@kelvin_degrees - 273.15) * 9 / 5 + 32
  end

  def <=> other
    to_kelvin <=> other.to_kelvin
  end

  private

  def convert_to_kelvin degrees, scale
    case scale
    when "kelvin"
      degrees
    when "celsius"
      degrees + 273.15
    when "fahrenheit"
      (degrees - 32) * 5 / 9 + 273.15
    else
      degrees
    end
  end
end
