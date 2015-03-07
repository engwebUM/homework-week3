require_relative './bowling'
require 'rspec'

RSpec.describe Bowling do
  context '#roll' do
    it 'rejects a negative roll' do
      my_bowling = Bowling.new
      output = my_bowling.roll(-1)

      expect(output).to match /jogada impossivel/
    end
  end

  context '#score' do
    # ...
  end
end
