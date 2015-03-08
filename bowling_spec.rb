require_relative './bowling'
require 'rspec'

RSpec.describe Bowling do
  # context '#roll' do
  #   # ...
  # end

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
