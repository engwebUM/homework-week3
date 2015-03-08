require_relative './bowling'
require 'rspec'

RSpec.describe Bowling do

	let(:game) { Bowling.new }

	context '#roll' do
		it 'invalid number of pins' do
			expect(game.run(11)).to eq 1		
		end

		it 'The game is finished. No more launches. (Case 1)' do
			18.times{game.run(1)}
			game.run(10)
			game.run(1)
			game.run(1)
			expect(game.run(1)).to eq 2
		end

		it 'The game is finished. No more launches. (Case 2)' do
			18.times{game.run(1)}
			2.times{game.run(5)}
			game.run(1)
			expect(game.run(1)).to eq 2
		end

		it 'The number of pins you want to add is incorrect' do
			18.times{game.run(1)}
			game.run(4)
			expect(game.run(8)).to eq 3
		end

		it 'The game is finished. No more launches. (Case 3)' do
			20.times{game.run(1)}
			expect(game.run(1)).to eq 2
		end

		it 'The number of pins dropped in the frame exceeded the limit of tens. (Case 1)' do
			game.run(4)
			expect(game.run(8)).to eq 4
		end

		it 'The number of pins dropped in the frame exceeded the limit of tens. (Case 2)' do
			game.run(3)
			game.run(0)
			game.run(4)
			expect(game.run(9)).to eq 4
		end

		it 'A perfect game. (Example from pins.jpg image)' do
			game.run(1)
			game.run(4)
			game.run(4)
			game.run(5)
			game.run(6)
			game.run(4)
			game.run(5)
			game.run(5)
			game.run(10)
			game.run(0)
			game.run(1)
			game.run(7)
			game.run(3)
			game.run(6)
			game.run(4)
			game.run(10)
			game.run(2)
			game.run(8)
			expect(game.run(6)).to eq 0
		end
	end

	context '#score' do
		it 'all zeros' do
			20.times{game.run(0)}
			expect(game.score).to eq 0
		end

		it 'all ones' do
			20.times{game.run(1)}
			expect(game.score).to eq 20
		end

		it 'all strikes' do
			12.times{game.run(10)}
			expect(game.score).to eq 300		
		end

		it 'all spares' do
			21.times{game.run(5)}
			expect(game.score).to eq 150
		end

		it 'first frame strike' do
			game.run(10)
			game.run(8)
			17.times{game.run(0)}
			expect(game.score).to eq 26
		end

		it 'example from pins.jpg' do
			game.run(1)
			game.run(4)
			game.run(4)
			game.run(5)
			game.run(6)
			game.run(4)
			game.run(5)
			game.run(5)
			game.run(10)
			game.run(0)
			game.run(1)
			game.run(7)
			game.run(3)
			game.run(6)
			game.run(4)
			game.run(10)
			game.run(2)
			game.run(8)
			game.run(6)
			expect(game.score).to eq 133
		end
	end
end
