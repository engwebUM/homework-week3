require_relative './bowling'
require 'rspec'

RSpec.describe Bowling do
  context '#upper and lower bounds - pins' do

    it 'verify roll with more than 10 pins' do
      expect {
      b = Bowling.new
      b.roll 11
      }.to raise_error
    end

    it 'verify roll with 10 pins' do
      b = Bowling.new
      b.roll 10
      output=b.score
      expect(output).to eq 10
    end

    it 'verify roll with less than 0 pins' do
      expect {
      b = Bowling.new
      b.roll -1
      }.to raise_error
    end

    it 'verify roll with 0 pins' do
      b = Bowling.new
      b.roll 0
      output=b.score
      expect(output).to eq 0
    end

  end

  context '#max and min possible points' do
    it 'verify maximum points possible' do
      b = Bowling.new

      for i in 0..11
        b.roll 10
      end

      output=b.score
      expect(output).to eq 300
    end

    it 'verify minimum points possible' do
      b = Bowling.new

      for i in 0..19
        b.roll 0
      end

      output=b.score
      expect(output).to eq 0
    end
  end

  context '#frames' do
    it 'verify when frames are higher than 10' do
      expect {
      b = Bowling.new

      for i in 0..12
        b.roll 10
      end
      }.to raise_error
    end

    it 'verify when frames are equals to 10' do
      b = Bowling.new

      for i in 0..11
        b.roll 10
      end

      output=b.score
      expect(output).to eq 300
    end
  end

  context '#tenth frame variations' do
    it 'verify when tenth frame contains strike can play extra frame' do
      b = Bowling.new

      for i in 0..9
        b.roll 10
      end
      b.roll 2  #tenth frame second attempt
      b.roll 9  #extra/bonus frame

      output=b.score
      expect(output).to eq 283
    end

    it 'verify when tenth frame contains spare can play extra frame' do
      b = Bowling.new

      for i in 0..8
        b.roll 10
      end
      b.roll 2  #tenth frame first attempt
      b.roll 8  #tenth frame second attempt (2+8 = spare)
      b.roll 9  #extra/bonus frame

      output=b.score
      expect(output).to eq 271
    end

    it 'verify when tenth frame does not contains spare or strike cannot play extra frame' do
      expect {
      b = Bowling.new

      for i in 0..8
        b.roll 10
      end

      b.roll 2  #tenth frame first attempt
      b.roll 7  #tenth frame second attempt (2+7 = 9)
      b.roll 9  #extra/bonus frame
    }.to raise_error
    end
  end

  context '#rolls variations' do
    it 'verify one simple roll' do
      b = Bowling.new

      b.roll 8

      output=b.score
      expect(output).to eq 8
    end

    it 'verify invalid number of pins for second roll' do
      expect {
      b = Bowling.new

      b.roll 8
      b.roll 3

      }.to raise_error
    end

    it 'verify valid number of pins for second roll' do
      b = Bowling.new

      b.roll 8
      b.roll 1

      output=b.score
      expect(output).to eq 9
    end

    it 'verify extra points for a spare' do
      b = Bowling.new

      b.roll 8
      b.roll 2
      b.roll 3

      output=b.score
      expect(output).to eq 16
    end

    it 'verify extra points for a strike' do
      b = Bowling.new

      b.roll 10
      b.roll 3
      b.roll 5

      output=b.score
      expect(output).to eq 26
    end

    it 'verify extra points for a strike when next frame itself contains a strike' do
      b = Bowling.new

      b.roll 10
      b.roll 10
      b.roll 5
      b.roll 2

      output=b.score
      expect(output).to eq 49
    end

    it 'verify extra points for a strike when next frame itself does not contains score' do
      b = Bowling.new

      b.roll 10
      b.roll 10
      b.roll 5
      #b.roll 2

      output=b.score
      expect(output).to eq 45
    end

    #when happens a strike for ninth frame than calculation is based on tenth frame
    #even when tenth frame contains a strike, in other cases calculation is based
    #on next two frames when next frame itself contains a strike
    it 'verify extra points for a strike on ninth frame, special case' do
      b = Bowling.new

      b.roll 1; b.roll 4
      b.roll 4; b.roll 5
      b.roll 6; b.roll 4
      b.roll 5; b.roll 5
      b.roll 10
      b.roll 0; b.roll 1
      b.roll 7; b.roll 3
      b.roll 6; b.roll 4
      b.roll 10
      b.roll 2; b.roll 8

      output=b.score
      expect(output).to eq 127
    end

    it 'verify pins.jpg test' do
      b = Bowling.new

      b.roll 1; b.roll 4
      b.roll 4; b.roll 5
      b.roll 6; b.roll 4
      b.roll 5; b.roll 5
      b.roll 10
      b.roll 0; b.roll 1
      b.roll 7; b.roll 3
      b.roll 6; b.roll 4
      b.roll 10
      b.roll 2; b.roll 8; b.roll 6

      output=b.score
      expect(output).to eq 133
    end
  end
end
