class ClamCard

  ZONE_B_STATIONS = ['Barbican', 'Balham', 'Bullhead', 'Bugel', 'Bison']

  attr_reader :total_price

  def initialize
    @total_price = 0
    @cap = 700
  end

  def journey_price(journey)
    @zone_b_entered = true if zone_b_journey?(journey)
    price_to_add = 0
    zone_b_journey?(journey) ? price_to_add += 300 : price_to_add += 250
    add_charge_to_total(price_to_add)
  end

  private

  def add_charge_to_total(price_to_add)
    set_cap
    @total_price + price_to_add > @cap ? @total_price = @cap : @total_price += price_to_add
  end

  def set_cap
    @cap = 800 if @zone_b_entered
  end

  def zone_b_journey?(journey)
    in_zone_b?(journey.start_station) || in_zone_b?(journey.end_station)
  end

  def in_zone_b?(station)
    ZONE_B_STATIONS.include?(station.name)
  end

end
