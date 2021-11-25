class Journey
  attr_accessor :stations, :in_journey, :entry_station, :exit_station

  def initialize
    @stations = []
    @in_journey = false
    @entry_station = nil
    @exit_station = nil
  end

  def in_journey?
    !(@entry_station == nil)
  end
end