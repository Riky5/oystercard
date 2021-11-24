# frozen_string_literal: true

require_relative "oystercard"
class Oystercard
  LIMIT = 90
  MINIMUM_AMOUNT = 1
  attr_reader :balance, :in_journey, :entry_station
  attr_accessor :stations

  def initialize
    @in_journey = false
    @balance = 0
    @entry_station = nil
    @stations = []
  end

  def top_up(money)
    raise "you have reached your top up limit of #{LIMIT}" if money + @balance > LIMIT
  
    @balance += money
  end

  
  def touch_in(station)
    raise "Need minimum amount of £#{MINIMUM_AMOUNT} to touch in" if under_minimum_amount
    @entry_station = station
    # return "you have touched in"
    
  end
  
  def touch_out(station)
    deduct(MINIMUM_AMOUNT)
    @stations << { :entry_station => @entry_station, :exit_station => station }
    @entry_station = nil
  end
  
  def under_minimum_amount
    @balance < MINIMUM_AMOUNT
  end
  
  def in_journey?
    if @entry_station == nil
      false
    else
      true
    end
  end
  private

  def deduct(money)
    @balance -= money
  end
  
end
