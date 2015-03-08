require_relative './bowling'
require 'rspec'


RSpec.describe Bowling do
  context '#roll' do

    it 'test number pins is numeric' do
      bl=Bowling.new
      expect{bl.roll("EngWeb")}.to raise_error
    end

    it 'test error raise number pins more than allowed' do
      bl=Bowling.new
      expect{bl.roll(11)}.to raise_error (ArgumentError)
    end

    it 'test error raise number pins less than allowed' do
      bl=Bowling.new
      expect{bl.roll(-1)}.to raise_error (ArgumentError)
    end

    it 'test error raise number pins more than allowed in two launch' do
      bl=Bowling.new
      expect{bl.roll(8)
             bl.roll(8)}.to raise_error (ArgumentError)
    end
    
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

    it 'test insert value best game' do
      bl=Bowling.new
     for i in 1..21
        bl.roll(10)
     end
      
      @total=bl.score
      expect(@total).to eq(300)
    end

    it 'test insert value always spare ' do
      bl=Bowling.new
     for i in 1..10
        bl.roll(6)
        bl.roll(4)
     end
       bl.roll(4)
      @total=bl.score
      expect(@total).to eq(158)
    end

    it 'test insert value half spare half strike' do
      bl=Bowling.new
     for i in 1..5
        bl.roll(6)
        bl.roll(4)
     end
     for i in 1..6
        bl.roll(10)
     end
       bl.roll(4)
      @total=bl.score
      expect(@total).to eq(228)
    end

    it 'test example pins.jpg' do
      bl=Bowling.new
      bl.roll(1)
      bl.roll(4)
      bl.roll(4)
      bl.roll(5)
      bl.roll(6)
      bl.roll(4)
      bl.roll(5)
      bl.roll(5)
      bl.roll(10)
      bl.roll(0)
      bl.roll(1)
      bl.roll(7)
      bl.roll(3)
      bl.roll(6)
      bl.roll(4)
      bl.roll(10)
      bl.roll(2)
      bl.roll(8)
      bl.roll(6)
      @total=bl.score
      expect(@total).to eq(133)
    end


  end
end
