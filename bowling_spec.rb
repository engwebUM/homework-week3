require_relative './bowling'
require 'rspec'

RSpec.describe Bowling do
  let (:bowling) { Bowling.new }

  # method that allow drop "pins" pins in "num" rolls
  def roll_times(num, pins)
    num.times {bowling.roll(pins)}
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
  end
end
