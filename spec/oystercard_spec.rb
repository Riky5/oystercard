# frozen_string_literal: true
require "oystercard"
RSpec.describe Oystercard do
  let(:station) { double(:station) }
  describe "#balance" do 
    it { is_expected.to respond_to(:balance) }

    it "will initialize with with a default balance of 0" do
      expect(subject.balance).to eq 0
    end
  end

  describe "#top_up" do
    it { is_expected.to respond_to(:top_up).with(1).argument }
  
    it "will top up balance" do
     expect { subject.top_up(3) }.to change{ subject.balance }.by(3) 
    end
    
    it "it raises an error if we try to top up more than our limit" do
      limit = Oystercard::LIMIT
      subject.top_up(limit)
      expect { subject.top_up(4) }.to raise_error "you have reached your top up limit of #{limit}"
    end
  end
  

  describe "#touch_in and #touch_out" do
    
    it "can touch in" do
      subject.top_up(Oystercard::MINIMUM_AMOUNT)
      subject.touch_in(station)
      expect(subject.in_journey?).to eq true
    end

    it "can touch out" do
      subject.top_up(Oystercard::MINIMUM_AMOUNT)
      subject.touch_in(station)
      subject.touch_out 
      expect(subject.in_journey).to eq false
    end

    it "recorded the station you have touched in at" do
      subject.top_up(Oystercard::MINIMUM_AMOUNT)
      expect(subject.touch_in(station)).to eq (station)
    end

    it "set entry station to nilon touch out" do
      subject.top_up(Oystercard::MINIMUM_AMOUNT)
      subject.touch_in(station)
      expect(subject.touch_out).to eq nil
    end

    it 'raises an error if we touch in with funds less than minimum amount' do
      # allow(subject).to receive(:touch_in).and_return true
      # subject.balance
      minimum_amount = Oystercard::MINIMUM_AMOUNT
      
      expect { subject.touch_in(station) }.to raise_error "Need minimum amount of £#{minimum_amount} to touch in"
    end 

    it "on touch out it will deduct from balance " do
      subject.top_up(Oystercard::MINIMUM_AMOUNT)
      subject.touch_in(station)
      expect { subject.touch_out }.to change{ subject.balance }.by(-Oystercard::MINIMUM_AMOUNT)
    end

  end
  
  describe "#in_journey?" do
    it "true if you touch in" do
    subject.top_up(Oystercard::MINIMUM_AMOUNT)
    subject.touch_in(station)
    expect(subject.in_journey?).to eq true
    end

    it "false if you touch on" do
      subject.top_up(Oystercard::MINIMUM_AMOUNT)
      subject.touch_in(station)
      subject.touch_out
      expect(subject.in_journey?).to eq false
      end
  end

end
