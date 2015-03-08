require_relative './bowling'
require 'rspec'

RSpec.describe Bowling do
  let(:b){
    b=Bowling.new
  }

  context '#roll' do
    # ...
    it 'ERRO! pins>10' do
      expect{
        b.roll(11)
      }.to raise_error "ErroPins"
    end
  end

  context '#score' do
    # ...
    def rolls(tentativas,pins)
      i=0
      while i<tentativas
        b.roll(pins)
        i+=1
      end
    end

    it '0 todas tentativas' do
      rolls(20,0)
      expect(b.score).to match(0)
    end

    it 'todos strikes' do
      rolls(12,10)
      expect(b.score).to match(300)
    end

    it 'todos spares' do
      rolls(21,5)
      expect(b.score).to match(150)
    end

    it '1 todas tentativas' do
      rolls(20,1)
      expect(b.score).to match(20)
    end

    it '1 spare' do
      b.roll(6)
      b.roll(4)
      b.roll(2)
      rolls(17,0)
      expect(b.score).to match(14)
    end

    it '1 strike' do
      b.roll(10)
      b.roll(3)
      b.roll(4)
      rolls(16,0)
      expect(b.score).to match(24)
    end

    it 'sem strikes e spares' do
      rolls(20,4)
      expect(b.score).to match(80)
    end

    it 'ultimo frame com strikes' do
      rolls(18,0)
      rolls(3,10)
      expect(b.score).to match(30)
    end

    it 'ultimo frame com spare' do
      rolls(18,0)
      rolls(2,5)
      b.roll(8)
      expect(b.score).to match(18)
    end

    it 'score num frame' do
        b.roll(6)
        b.roll(3)
        expect(b.score).to match(9)
    end

    it 'rolls do anunciado com score 133 pontos' do
      pins = [1,4,4,5,6,4,5,5,10,0,1,7,3,6,4,10,2,8,6]
      pins.each do |pin|
        b.roll(pin)
      end
      expect(b.score).to match(133)
    end

    it 'ERRO! Jogar depois do jogo estar terminado' do
      expect{
        rolls(21,0)
        b.score
      }.to raise_error "ErroTerminado"
    end

    it 'ERRO! jogadas incompletas com um strike' do
      expect{
        b.roll(10)
        b.roll(6)
        b.score
      }.to raise_error "ErroIncompletoStrike"
    end

    it 'ERRO! Jogadas incompletas com um spare' do
      expect{
        rolls(2,5)
        b.score
      }.to raise_error "ErroIncompletoSpare"
    end

    it 'ERRO! Jogadas incompletas num frame' do
      expect{
        b.roll(5)
        b.score
      }.to raise_error "ErroIncompleto"
    end

    it 'ERRO! score > 10 num frame' do
      expect{
        b.roll(10)
        b.roll(6)
        b.roll(5)
        b.score
      }.to raise_error "ErroScore"
    end
  end
end
