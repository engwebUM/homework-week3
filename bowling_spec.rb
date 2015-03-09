require_relative './bowling'
require 'rspec'

RSpec.describe Bowling do
  context '#roll' do
      
      it 'STRIKE' do
          expect(@jogo.roll(10)).to match [10,0]
      end
      
      it 'KNOCK DOWN 5 PINS FIRST ROLL' do
          expect(@jogo.roll(5)).to match [5]
      end
      
      it 'SPARE TEST' do
          @jogo.roll(7)
          @jogo.roll(3)
          expect(@jogo.rolls).to match [7,3]
      end
  end

  context '#score' do
      
      it 'SCORE 4 AFTER TWO ROLLS (2,2)' do
          @jogo.roll(2)
          @jogo.roll(2)
          expect(@jogo.score).to eq 4
      end
      
      it 'SCORE 0 AFTER ONE ROLL' do
          @jogo.roll(0)
          expect(@jogo.score).to eq 0
      end
      
      it 'STRIKE AFTER TWO ROLLS OF 2' do
          @jogo.roll(2)
          @jogo.roll(2)
          @jogo.roll(10)
          expect(@jogo.score).to eq 14
      end
      
      it 'LOSER PLAYER TEST' do
          @jogo.roll(0)
          @jogo.roll(0)
          @jogo.roll(0)
          @jogo.roll(0)
          @jogo.roll(0)
          @jogo.roll(0)
          @jogo.roll(0)
          @jogo.roll(0)
          @jogo.roll(0)
          @jogo.roll(0)
          @jogo.roll(0)
          @jogo.roll(0)
          @jogo.roll(0)
          @jogo.roll(0)
          @jogo.roll(0)
          @jogo.roll(0)
          @jogo.roll(0)
          @jogo.roll(0)
          @jogo.roll(0)
          @jogo.roll(0)
          expect(@jogo.score).to eq 0
      end
  end
end