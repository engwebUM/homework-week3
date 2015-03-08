require_relative './bowling'
require 'rspec'

RSpec.describe Bowling do
	
	let(:game) { Bowling.new }

	context '#roll' do
		it 'invalid number of pins' do
			expect(game.roll(11)).to match /ErrNoPins/		
		end

		it 'game finished, your strike bonus finished' do
			12.times{game.roll(10)}
			expect(game.roll(6)).to match /ErrEndGame2/		
		end

		it 'game finished, your spare bonus finished' do
			18.times{game.roll(1)}
			2.times{game.roll(5)}
			game.roll(1)
			expect(game.roll(2)).to match /ErrEndGame3/
		end

		it "it's not possible to insert the pins you rolled" do
			19.times{game.roll(4)}
			expect(game.roll(8)).to match /ErrInsertSecondLaunch/
		end

		it "game finished, you don't have bonus to play anymore" do
			20.times{game.roll(4)}
			expect(game.roll(3)).to match /ErrEndGame1/
		end

		it "it's not possible to insert the pins you rolled" do
			3.times{game.roll(4)}
			expect(game.roll(9)).to match /ErrInsertSecondLaunch/
		end
	end

	context '#score' do
		it 'all zeros' do
			20.times{game.roll(0)}
			expect(game.score).to eq 0
		end

		it 'all ones' do
			20.times{game.roll(1)}
			expect(game.score).to eq 20
		end

		it 'all strikes' do
			12.times{game.roll(10)}
			expect(game.score).to eq 300		
		end

		it 'all spares' do
			21.times{game.roll(5)}
			expect(game.score).to eq 150
		end

		it 'first frame strike' do
			game.roll(10)
			game.roll(8)
			17.times{game.roll(0)}
			expect(game.score).to eq 26
		end

		it 'example from pins.jpg' do
			game.roll(1)
			game.roll(4)
			game.roll(4)
			game.roll(5)
			game.roll(6)
			game.roll(4)
			game.roll(5)
			game.roll(5)
			game.roll(10)
			game.roll(0)
			game.roll(1)
			game.roll(7)
			game.roll(3)
			game.roll(6)
			game.roll(4)
			game.roll(10)
			game.roll(2)
			game.roll(8)
			game.roll(6)
			expect(game.score).to eq 133
		end
	end
end
