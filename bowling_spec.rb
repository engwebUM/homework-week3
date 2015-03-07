require_relative './bowling'
require 'rspec'

RSpec.describe Bowling do
  context '#roll' do
    it 'rejects a negative roll' do
      my_bowling = Bowling.new
      output = my_bowling.roll(-1)

      expect(output).to match /jogada impossivel/
    end

    it 'rejects a roll greater than 10' do
      my_bowling = Bowling.new
      output = my_bowling.roll(11)

      expect(output).to match /jogada impossivel/
    end

    it 'accepts a normal roll' do
      my_bowling = Bowling.new
      output = my_bowling.roll(10)

      expect(output).to eq nil
    end
  end

  context '#score' do
    it 'prints score 0 when game is started' do
      my_bowling = Bowling.new
      output = my_bowling.score

      expect(output).to eq "Score: 0"
    end
  end
end
