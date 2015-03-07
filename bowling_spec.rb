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
    it 'prints score 0 when game is started' do
      bowling = Bowling.new
      output = bowling.score

      expect(output).to eq "Score: 0"
    end

    it 'prints correct score after rolling 1 pin' do
      bowling = Bowling.new
      bowling.roll(1)
      output = bowling.score

      expect(output).to eq "Score: 1"
    end
  end
end
