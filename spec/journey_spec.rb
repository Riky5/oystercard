# frozen_string_literal: true

require "journey"

RSpec.describe Journey do
  describe "#fare" do
    let!(:journey) { Journey.new }

    it { is_expected.to respond_to :fare }

    it "returns minimum fare" do
      journey.stations << { entry_station: "Oval", exit_station: "Aldgate" }
      expect(journey.fare).to eq 1
    end

    it "returns penalty fare if you forget to touch_in" do
      journey.stations << { entry_station: nil, exit_station: "Aldgate" }
      expect(journey.fare).to eq 6
    end

    it "returns penalty fare if you forgot to touch_out" do
      journey.stations << { entry_station: "Oval", exit_station: nil }
      expect(journey.fare).to eq 6
    end
  end
end
