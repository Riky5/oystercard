# frozen_string_literal: true

require_relative "journey"

class Oystercard
  LIMIT = 90
  MINIMUM_AMOUNT = 1
  PENALTY_FARE = 6
  attr_reader :balance
  attr_accessor :journey

  def initialize
    @balance = 0
    @journey = Journey.new
  end

  def top_up(money)
    raise "you have reached your top up limit of #{LIMIT}" if limit?(money)

    @balance += money
  end

  def limit?(money)
    (money + @balance) > LIMIT
  end

  def touch_in(entry_station)
    raise "Need minimum amount of £#{MINIMUM_AMOUNT} to touch in" if under_minimum_amount

    @journey.entry_station = entry_station
  end

  def touch_out(exit_station)
    if exit_station.nil? && !@journey.entry_station.nil?
      deduct(PENALTY_FARE)
    elsif exit_station.nil? && @journey.entry_station.nil?
      deduct(PENALTY_FARE)
    else
      deduct(MINIMUM_AMOUNT)
    end
    @journey.stations << { entry_station: @journey.entry_station, exit_station: exit_station }
    @journey.entry_station = nil
  end

  def under_minimum_amount
    @balance < MINIMUM_AMOUNT
  end

  private

  def deduct(money)
    @balance -= money
  end
end
