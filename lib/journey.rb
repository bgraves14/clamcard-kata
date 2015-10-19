class Journey

  attr_reader :start_station, :end_station

  def touch_in(station)
    @start_station = station
  end

  def touch_out(station)
    @end_station = station
  end

end
