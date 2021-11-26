# frozen_string_literal: true

class Journey
  attr_accessor :stations, :in_journey, :entry_station, :exit_station

  def initialize
    @stations = []
    @in_journey = false
    @entry_station = nil
    @exit_station = nil
  end

  def in_journey?
    @entry_station != nil
  end

  def fare
    if @stations[0][:entry_station].nil? || @stations[0][:exit_station].nil?
      Oystercard::PENALTY_FARE
    else
      Oystercard::MINIMUM_AMOUNT
    end
  end
end
