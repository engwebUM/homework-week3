require_relative './bowling'
require 'rspec'

RSpec.describe Bowling do
	before do
		@jogo = Bowling.new
	end
	
	
	context '#roll' do
	
		it 'TESTE: primeiro roll acerta 3 pinos' do
			expect(@jogo.roll(3)).to match [3]
		end
		
		it 'TESTE: STRIKE' do
			expect(@jogo.roll(10)).to match [10,0]
		end
		
		it 'TESTE: STRIKE após cenas' do
			@jogo.roll(3)
			@jogo.roll(3)
			expect(@jogo.roll(10)).to match [3,3,10,0]
		end
		
		it 'TESTE: 1 roll após STRIKE após cenas' do
			@jogo.roll(3)
			@jogo.roll(3)
			@jogo.roll(10)
			expect(@jogo.roll(2)).to match [3,3,10,0,2]
		end
		
		it 'TESTE: cenas após STRIKE após cenas' do
			@jogo.roll(3)
			@jogo.roll(3)
			@jogo.roll(10)
			@jogo.roll(5)
			@jogo.roll(3)
			expect(@jogo.rolls).to match [3,3,10,0,5,3]
		end
		
		it 'TESTE: cenas após SPARE após cenas' do
			@jogo.roll(3)
			@jogo.roll(3)
			@jogo.roll(7)
			@jogo.roll(3)
			@jogo.roll(5)
			@jogo.roll(3)
			expect(@jogo.rolls).to match [3,3,7,3,5,3]
		end
		
		it 'TESTE: jogo completo sempre 10' do
			@jogo.roll(10)
			@jogo.roll(10)
			@jogo.roll(10)
			@jogo.roll(10)
			@jogo.roll(10)
			@jogo.roll(10)
			@jogo.roll(10)
			@jogo.roll(10)
			@jogo.roll(10)
			@jogo.roll(10)
			@jogo.roll(10)
			@jogo.roll(10)
			expect(@jogo.rolls).to eq [10,0,10,0,10,0,10,0,10,0,10,0,10,0,10,0,10,0,10,0,10,0,10,0]
		end
		
	end
	
	
	context '#score' do
	
		it 'TESTE: 1 rolls de 0' do
			@jogo.roll(0)
			expect(@jogo.score).to eq 0
		end
	
		it 'TESTE: 1 rolls de 3' do
			@jogo.roll(3)
			expect(@jogo.score).to eq 3
		end
	
		it 'TESTE: 2 rolls de 3' do
			@jogo.roll(3)
			@jogo.roll(3)
			expect(@jogo.score).to eq 6
		end
		
		it 'TESTE: 3 rolls diferentes' do
			@jogo.roll(3)
			@jogo.roll(2)
			@jogo.roll(1)
			expect(@jogo.score).to eq 6
		end
		
		it 'TESTE: 6 rolls de 3' do
			@jogo.roll(3)
			@jogo.roll(3)
			@jogo.roll(3)
			@jogo.roll(3)
			@jogo.roll(3)
			@jogo.roll(3)
			expect(@jogo.score).to eq 18
		end	
		
		it 'TESTE: 6 rolls de 0' do
			@jogo.roll(0)
			@jogo.roll(0)
			@jogo.roll(0)
			@jogo.roll(0)
			@jogo.roll(0)
			@jogo.roll(0)
			expect(@jogo.score).to eq 0
		end
		
		it 'TESTE: 1 frame após STRIKE após 1 frame' do
			@jogo.roll(2)
			@jogo.roll(3)
			@jogo.roll(10)
			@jogo.roll(2)
			@jogo.roll(3)
			expect(@jogo.score).to eq 25
		end
		
		it 'TESTE: outro - 1 frame após STRIKE após 1 frame' do
			@jogo.roll(1)
			@jogo.roll(1)
			@jogo.roll(10)
			@jogo.roll(1)
			@jogo.roll(1)
			expect(@jogo.score).to eq 16
		end
		
		it 'TESTE: STRIKE após 1 frame' do
			@jogo.roll(2)
			@jogo.roll(3)
			@jogo.roll(10)
			expect(@jogo.score).to eq 15
		end
		
		it 'TESTE: 1 roll de 0 após STRIKE após 1 frame' do
			@jogo.roll(2)
			@jogo.roll(3)
			@jogo.roll(10)
			@jogo.roll(0)
			expect(@jogo.score).to eq 15
		end
		
		it 'TESTE: 1 roll de 1 após STRIKE após 1 frame' do
			@jogo.roll(2)
			@jogo.roll(3)
			@jogo.roll(10)
			@jogo.roll(1)
			expect(@jogo.score).to eq 17
		end
	
		it 'TESTE: jogo completo sempre 2 e 3' do
			@jogo.roll(2)
			@jogo.roll(3)
			@jogo.roll(2)
			@jogo.roll(3)			
			@jogo.roll(2)
			@jogo.roll(3)
			@jogo.roll(2)
			@jogo.roll(3)			
			@jogo.roll(2)
			@jogo.roll(3)
			@jogo.roll(2)
			@jogo.roll(3)
			@jogo.roll(2)
			@jogo.roll(3)
			@jogo.roll(2)
			@jogo.roll(3)
			@jogo.roll(2)
			@jogo.roll(3)
			@jogo.roll(2)
			@jogo.roll(3)
			expect(@jogo.score).to eq 50
		end
	
		it 'TESTE: 1 roll de 0 e um de 1 após 2 STRIKES seguidos' do
			@jogo.roll(10)
			@jogo.roll(10)
			@jogo.roll(1)
			@jogo.roll(0)
			expect(@jogo.score).to eq 33
		end
  
		it 'TESTE: jogo completo sempre 10' do
			@jogo.roll(10)
			@jogo.roll(10)
			@jogo.roll(10)
			@jogo.roll(10)
			@jogo.roll(10)
			@jogo.roll(10)
			@jogo.roll(10)
			@jogo.roll(10)
			@jogo.roll(10)
			@jogo.roll(10)
			@jogo.roll(10)
			@jogo.roll(10)
			expect(@jogo.score).to eq 300
		end
  
	end
 
 
end
