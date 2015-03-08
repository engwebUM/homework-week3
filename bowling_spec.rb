require_relative './bowling'
require 'rspec'

RSpec.describe Bowling do
  context '#roll' do
  end

  context '#score' do
  	  		it 'pins.jpg' do
				b = Bowling.new
				b.roll(1)
				b.roll(4)

				b.roll(4)
				b.roll(5)

				b.roll(6)
				b.roll(4)

				b.roll(5)
				b.roll(5)

				b.roll(10)

				b.roll(0)
				b.roll(1)

				b.roll(7)
				b.roll(3)

				b.roll(6)
				b.roll(4)

				b.roll(10)

				b.roll(2)
				b.roll(8)

				b.roll(6)
		    expect(b.score).to eq 133
		end 

		it 'strikes' do
			b = Bowling.new
			b.roll(10)
			b.roll (10)
			b.roll(10)
			b.roll (10)
			b.roll(10)
			b.roll (10)
			b.roll(10)
			b.roll (10)
			b.roll(10)
			b.roll (10)
			b.roll(10)
			b.roll (10)
			expect(b.score).to eq 300
		end

		it 'spares' do
			b = Bowling.new
			b.roll(5); b.roll(5)
			b.roll (5); b.roll(5)
			b.roll(5); b.roll(5)
			b.roll (5); b.roll(5)
			b.roll(5); b.roll(5)
			b.roll (5); b.roll(5)
			b.roll(5); b.roll(5)
			b.roll (5); b.roll(5)
			b.roll(5); b.roll(5)
			b.roll (5); b.roll(5)
			b.roll(5); b.roll(5)
			b.roll (5)
			expect(b.score).to eq 150
		end
  end
end
