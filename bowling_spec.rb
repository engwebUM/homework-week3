require_relative 'homework-week3/bowling'
require 'rspec'

RSpec.describe Bowling do
  let(:game) { Bowling.new }

  context '#roll' do
  end

  def apply_rolls(*rolls)
    rolls.each do |roll|
      game.roll(roll)
    end
  end

  EXAMPLES = [
    # Basic examples
    {
      rolls: [],
      score: 0
    },
    {
      rolls: [0],
      score: 0
    },
    {
      rolls: [0] * 10,
      score: 0
    },
    {
      rolls: [1],
      score: 1
    },

    # Wikipedia examples
    # http://en.wikipedia.org/wiki/Ten-pin_bowling#Scoring
    {
      rolls: [10, 3, 6],
      score: 28
    },
    {
      rolls: [10, 10, 9, 0],
      score: 57
    },
    {
      rolls: [10, 10, 10, 0, 9],
      score: 78
    },
    {
      rolls: [10, 10, 4, 2],
      score: 46
    },
    {
      rolls: [7, 3, 4, 2],
      score: 20
    },
    {
      rolls: [10] * 12,
      score: 300
    }
  ]

  EXAMPLES.each do |example|
    it "works for #{example[:rolls]}" do
      apply_rolls(*example[:rolls])

      expect(game.score).to eq example[:score]
    end
  end
end
