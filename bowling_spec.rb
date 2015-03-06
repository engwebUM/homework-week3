require_relative './bowling'
require 'rspec'

RSpec.describe Bowling do
  context '#roll' do

    # ...
  end

  context '#score' do
    it 'test input values first round' do
      bl=Bowling.new
      bl.roll(8)
      bl.roll(1)
      @total=bl.score
      expect(@total).to eq(9)
    end

    it 'test insert strike values' do
      bl=Bowling.new
      bl.roll(8)
      bl.roll(1)
      bl.roll(10)
      bl.roll(1)
      bl.roll(8)
      
      @total=bl.score
      expect(@total).to eq(37)
    end

    it 'test insert spare values' do
      bl=Bowling.new
      bl.roll(8)
      bl.roll(1)
      bl.roll(6)
      bl.roll(4)
      bl.roll(1)
      bl.roll(8)
      
      @total=bl.score
      expect(@total).to eq(29)
    end

    it 'test insert minimum values' do
      bl=Bowling.new
     for i in 1..20
        bl.roll(1)
     end
      
      @total=bl.score
      expect(@total).to eq(20)
    end

    it 'test insert value for best game' do
      bl=Bowling.new
     for i in 1..21
        bl.roll(10)
     end
      
      @total=bl.score
      expect(@total).to eq(300)
    end
    # ...
  end
end
