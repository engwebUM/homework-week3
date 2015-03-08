require_relative './bowling'
require 'rspec'

RSpec.describe Bowling do
  context '#roll' do
    it 'accepts a normal roll' do
      bowling = Bowling.new

      expect { bowling.roll(10) }.not_to raise_error
    end

    it 'rejects a negative roll' do
      bowling = Bowling.new

      expect { bowling.roll(-1) }.to raise_error("impossible play")
    end

    it 'rejects a roll greater than 10' do
      bowling = Bowling.new

      expect { bowling.roll(11) }.to raise_error("impossible play")
    end

    it 'rejects a roll greater than standing pins' do
      bowling = Bowling.new
      bowling.roll(6)

      expect { bowling.roll(6) }.to raise_error("impossible play")
    end

    it 'rejects a roll after the game is over' do
      bowling = Bowling.new
      for i in 1..20
        bowling.roll(0)
      end

      expect { bowling.roll(10) }.to raise_error("game over")
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
      for i in 1..20
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

      expect(bowling.score).to eq 15
    end

    it 'returns correct score after a strike' do
      bowling = Bowling.new
      bowling.roll(10)
      bowling.roll(2)
      bowling.roll(1)

      expect(bowling.score).to eq 16
    end

    it 'returns correct score after 12 strikes' do
      bowling = Bowling.new
      for i in 1..12
        bowling.roll(10)
      end

      expect(bowling.score).to eq 300
    end

    it 'returns correct score after rolling 5 everytime' do
      bowling = Bowling.new
      for i in 1..21
        bowling.roll(5)
      end

      expect(bowling.score).to eq 150
    end

    it 'returns correct score after a predefined game' do
      bowling = Bowling.new
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
      bowling.roll(1)
      bowling.roll(7)
      bowling.roll(3)
      bowling.roll(6)
      bowling.roll(4)
      bowling.roll(10)
      bowling.roll(2)
      bowling.roll(8)
      bowling.roll(6)

      expect(bowling.score).to eq 133
    end
  end
end
