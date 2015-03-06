require_relative './bowling'
require 'rspec'

RSpec.describe Bowling do
  let (:bowling) { Bowling.new }

  # method that allow drop "pins" pins in "num" rolls
  def roll_times(num, pins)
    num.times {bowling.roll(pins)}
  end

  def make_strike()
    bowling.roll(10)
  end

  context '#score' do
    it "expect score 0 for a worst game" do
      roll_times(21, 0)
      expect(bowling.score).to eq 0
    end
    it "expect score 10 for hit a pin in each roll" do
      roll_times(10, 1)
      expect(bowling.score).to eq 10
    end
    it "expect score 30 for hit three pins in each roll" do
      roll_times(10, 3)
      expect(bowling.score).to eq 30
    end
    it "expect score 300 for excellent game" do
      roll_times(12, 10)
      expect(bowling.score).to eq 300
    end
    it "expect score 28 for a strike and then roll 2 and 7 pins" do
        make_strike # after next two rolls this value is 19, 10 (strike) + 2 (first roll) + 7 (two roll)
        bowling.roll(2)
        bowling.roll(7)
        expect(bowling.score).to eq 28
    end
  end
end
