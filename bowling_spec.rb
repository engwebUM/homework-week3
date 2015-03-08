require_relative './bowling'
require 'rspec'

RSpec.describe Bowling do

  context '#roll' do
    bowling = Bowling.new
    it "expect frames with [[2]]" do
      bowling.roll(2)
      expect(bowling.frames).to eq [[2]]
    end

    it "expect array with [[2,4]]" do
      bowling.roll(4)
      expect(bowling.frames).to eq [[2,4]]
    end

    it "expect array with [[2,4],[10,0]]" do
      bowling.roll(10)
      expect(bowling.frames).to eq [[2,4],[10,0]]
    end
  end

  context '#score' do
    bowling = Bowling.new
    it "expect score 0" do
      expect(bowling.score).to eq 0
    end

    it "expect score 2" do
      bowling.roll(2)
      expect(bowling.score).to eq 2
    end

    it "expect score 2" do
      bowling.roll(2)
      expect(bowling.score).to eq 4
    end

    it"strike expect score 24" do
      bowling.roll(10)
      bowling.roll(2)
      bowling.roll(3)
      expect(bowling.score).to eq 24
    end

    it"spare expect score 40" do
      bowling.roll(5)
      bowling.roll(5)
      bowling.roll(3)
      expect(bowling.score).to eq 40
    end

  end
end
