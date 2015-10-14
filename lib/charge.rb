class Charge

  ZONE_B_STATIONS = ['Barbican', 'Balham', 'Bullhead', 'Bugel', 'Bison']

  attr_reader :total_price

  def initialize
    @total_price = 0
  end

  def journey_price(journey)
    zone_b_journey?(journey) ? @total_price += 300 : @total_price += 250
  end

  private

  def zone_b_journey?(journey)
    in_zone_b?(journey.start_station) || in_zone_b?(journey.end_station)
  end

  def in_zone_b?(station)
    ZONE_B_STATIONS.include?(station.name)
  end

end
