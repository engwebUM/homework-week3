require_relative './bowling'
require 'rspec'

RSpec.describe Bowling do
  context '#score' do
    it "expect score 0 for a worst game" do
      bowling = Bowling.new
      22.times {bowling.roll(0)}
      expect(bowling.score).to eq 0
    end
  end
end
