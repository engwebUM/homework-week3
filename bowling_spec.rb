require_relative './bowling'
require 'rspec'

RSpec.describe Bowling do
  context '#roll' do
    it 'rejects a negative roll' do
      bowling = Bowling.new

      expect { bowling.roll(-1) }.to raise_error("jogada impossivel")
    end

    it 'rejects a roll greater than 10' do
      bowling = Bowling.new

      expect { bowling.roll(11) }.to raise_error("jogada impossivel")
    end

    it 'accepts a normal roll' do
      bowling = Bowling.new

      expect { bowling.roll(10) }.not_to raise_error
    end
  end

  context '#score' do
    it 'returns score 0 when game is started' do
      bowling = Bowling.new

      expect(bowling.score).to eq 0
    end

    it 'returns correct score after rolling 1 pin' do
      bowling = Bowling.new
      bowling.roll(1)

      expect(bowling.score).to eq 1
    end

    it 'returns correct score after missing every time' do
      bowling = Bowling.new
      for i in 0..20
        bowling.roll(0)
      end

      expect(bowling.score).to eq 0
    end

    it 'returns correct score after a spare' do
      bowling = Bowling.new
      bowling.roll(7)
      bowling.roll(3)
      bowling.roll(2)
      bowling.roll(1)

      expect(bowling.score).to eq 14
    end

    it 'returns correct score after a strike' do
      bowling.roll(10)
      bowling.roll(2)
      bowling.roll(1)

      expect(bowling.score).to eq 16
    end
  end
end
