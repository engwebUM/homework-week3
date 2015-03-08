require_relative './bowling'
require 'rspec'

RSpec.describe Bowling do
  context '#roll' do
    it "Force play more than the rolls available." do
      game = Bowling.new
      20.times {game.roll(0)}
      expect(game.roll(0)).to match /Game is already over/
    end

    it "Tries to insert invalid numbers to game." do
      game = Bowling.new
      expect(game.roll(-1)).to match /Invalid Values/
    end

    it "Tries to insert more than 10 pins in a normal frame." do
      game = Bowling.new
      # First Roll: 6 pins + Second Roll: 7 pins == 13 Pins => expected an error
      game.roll(6)
      expect(game.roll(7)).to match /Exceeds the maximum/
    end

    it "Tries to insert more than 10 pins in two rolls in Last frame, when dont Strike in first roll of the last frame." do
      game = Bowling.new
      9.times { game.roll(10) } # first 9 frames with 10
      # Last Frame First Roll: 7 pins + Second Roll: 7 pins == 14 Pins => expected an error
      game.roll(7)
      expect(game.roll(7)).to match /Exceeds the maximum pins available/
    end

  end

  context '#score' do
    # Ideas taken from:
    # http://butunclebob.com/ArticleS.DavidChelimsky.BowlingWithRspec
    # http://rspec.info/

    it "Down 0 pin in all rolls." do
      game = Bowling.new
      20.times {game.roll(0)}
      expect(game.score).to eq 0
    end

    it "Down 1 pin in all rolls." do
      game = Bowling.new
      20.times {game.roll(1)}
      expect(game.score).to eq 20
    end

    it "Down 5 pins in all rolls." do
      game = Bowling.new
      21.times {game.roll(5)}
      expect(game.score).to eq 150
    end

    it "Down 10 pins in all rolls" do
      game = Bowling.new
      12.times {game.roll(10)}
      expect(game.score).to eq 300
    end
  end
end
