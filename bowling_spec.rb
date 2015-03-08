require_relative './bowling'
require 'rspec'

RSpec.describe Bowling do
  let(:bowling) {Bowling.new}

  def roll_balls(bowling_obj, rolls)
    rolls.each do |roll|
      bowling_obj.roll(roll)
    end
  end

  context '#roll' do
    it 'accepts a normal roll' do
      expect { bowling.roll(10) }.not_to raise_error
    end

    it 'rejects a negative roll' do
      expect { bowling.roll(-1) }.to raise_error("impossible play")
    end

    it 'rejects a roll greater than 10' do
      expect { bowling.roll(11) }.to raise_error("impossible play")
    end

    it 'rejects a roll greater than standing pins' do
      bowling.roll(6)

      expect { bowling.roll(6) }.to raise_error("impossible play")
    end

    it 'rejects a roll after the game is over' do
      for i in 1..20
        bowling.roll(0)
      end

      expect { bowling.roll(10) }.to raise_error("game over")
    end
  end

  context '#score' do
    it 'returns score 0 when game is started' do
      expect(bowling.score).to eq 0
    end

    it 'returns correct score after rolling 1 pin' do
      bowling.roll(1)

      expect(bowling.score).to eq 1
    end

    it 'returns correct score after missing every time' do
      for i in 1..20
        bowling.roll(0)
      end

      expect(bowling.score).to eq 0
    end

    it 'returns correct score after a spare' do
      roll_balls(bowling, [7, 3, 2, 1])

      expect(bowling.score).to eq 15
    end

    it 'returns correct score after a strike' do
      roll_balls(bowling, [10, 2, 1])

      expect(bowling.score).to eq 16
    end

    it 'returns correct score after 12 strikes' do
      for i in 1..12
        bowling.roll(10)
      end

      expect(bowling.score).to eq 300
    end

    it 'returns correct score after rolling 5 everytime' do
      for i in 1..21
        bowling.roll(5)
      end

      expect(bowling.score).to eq 150
    end

    it 'returns correct score after a predefined game' do
      roll_balls(bowling, [1, 4, 4, 5, 6, 4, 5, 5, 10, 0, 1, 7, 3, 6, 4, 10, 2, 8, 6])

      expect(bowling.score).to eq 133
    end
  end
end
