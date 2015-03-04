require_relative './bowling'
require 'rspec'

RSpec.describe Bowling do
  context '#upper and lower bounds' do

    it 'higher than 10 pins' do
      expect {
      b = Bowling.new
      b.roll 11
      }.to raise_error
    end

    it 'equals 10 pins' do
      b = Bowling.new
      b.roll 10
      output=b.score

      expect(output).to eq 10
    end

    it 'lower than 0 pins' do
      expect {
      b = Bowling.new
      b.roll -1
      }.to raise_error
    end

    it 'equals 0 pins' do
      b = Bowling.new
      b.roll 0
      output=b.score

      expect(output).to eq 0
    end

  end

  context '#max and min points possible' do
    it 'maximum points possible' do
      b = Bowling.new
      for i in 0..11
        b.roll 10
      end

      output=b.score

      expect(output).to eq 300
    end

    it 'minimum points possible' do
      b = Bowling.new
      for i in 0..19
        b.roll 0
      end

      output=b.score

      expect(output).to eq 0
    end
  end

  context '#frames' do
    it 'equals 10 frames' do
      b = Bowling.new
      for i in 0..11
        b.roll 10
      end

      output=b.score

      expect(output).to eq 300
    end

    it 'higher than 10 frames' do
      expect {
      b = Bowling.new
      for i in 0..12
        b.roll 10
      end
      }.to raise_error
    end
  end
end
