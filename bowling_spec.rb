require_relative './bowling'
require 'rspec'

RSpec.describe Bowling do
  context '#roll' do
    # ...

  end

  context '#score' do
    # ...
    it "0 pins in each roll" do
      bowling=Bowling.new
      bowling.roll(0)
      bowling.roll(0)
      bowling.roll(0)
      bowling.roll(0)
      bowling.roll(0)
      bowling.roll(0)
      bowling.roll(0)
      bowling.roll(0)
      bowling.roll(0)
      bowling.roll(0)
      bowling.roll(0)
      bowling.roll(0)
      bowling.roll(0)
      bowling.roll(0)
      bowling.roll(0)
      bowling.roll(0)
      bowling.roll(0)
      bowling.roll(0)
      bowling.roll(0)
      bowling.roll(0)
      bowling.score.expect eq(0)
    end

    it "10 strikes" do
      bowling=Bowling.new
      bowling.roll(10)
      bowling.roll(0)
      bowling.roll(10)
      bowling.roll(0)
      bowling.roll(10)
      bowling.roll(0)
      bowling.roll(10)
      bowling.roll(0)
      bowling.roll(10)
      bowling.roll(0)
      bowling.roll(10)
      bowling.roll(0)
      bowling.roll(10)
      bowling.roll(0)
      bowling.roll(10)
      bowling.roll(0)
      bowling.roll(10)
      bowling.roll(0)
      bowling.roll(10)
      bowling.roll(10)
      bowling.roll(10)
      bowling.score.expect eq(300)
    end

    it "image example" do
      bowling=Bowling.new
      bowling.roll(1)
      bowling.roll(4)
      bowling.roll(4)
      bowling.roll(5)
      bowling.roll(6)
      bowling.roll(4)
      bowling.roll(5)
      bowling.roll(5)
      bowling.roll(10)
      bowling.roll(0)
      bowling.roll(0)
      bowling.roll(1)
      bowling.roll(7)
      bowling.roll(3)
      bowling.roll(6)
      bowling.roll(4)
      bowling.roll(10)
      bowling.roll(0)
      bowling.roll(2)
      bowling.roll(8)
      bowling.roll(6)
      bowling.score.expect eq(0)
    end

    it "5 pins in each roll" do
      bowling=Bowling.new
      bowling.roll(5)
      bowling.roll(5)
      bowling.roll(5)
      bowling.roll(5)
      bowling.roll(5)
      bowling.roll(5)
      bowling.roll(5)
      bowling.roll(5)
      bowling.roll(5)
      bowling.roll(5)
      bowling.roll(5)
      bowling.roll(5)
      bowling.roll(5)
      bowling.roll(5)
      bowling.roll(5)
      bowling.roll(5)
      bowling.roll(5)
      bowling.roll(5)
      bowling.roll(5)
      bowling.roll(5)
      bowling.roll(5)
      bowling.score.expect eq(150)
    end


  end
end

