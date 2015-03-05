class Bowling
	attr_accessor :pontos, :jogada, :tentativas, :pins, :strike, :spare, :jogadaExtra

	def initialize
		@pontos = 0
		@jogada = 0
		@tentativas = 0
		@pins = 10
		@strike = 0
		@spare = 0
		@jogadaExtra = false
	end

	def roll(pins)
		# roll the desired number of pins
		if @tentativas == 0
			@jogada += 1
			@tentativas = 2
			@pins = 10
		end
		if jogada <= 10
			if @strike > 0
				@pontos += pins
				@strike -= 1
			end
			if @spare > 0
				@pontos += pins
				@spare -= 1
			end
			@pontos += pins
			@pins = @pins - pins
			@tentativas -= 1
			if @pins == 0 && @tentativas == 1
				@strike = 2
				if jogada == 10
					@jogadaExtra = true
				else 
					@tentativas = 0
				end
			elsif @pins == 0 && @tentativas == 0
				@spare = 1
				if jogada == 10
					@spare = 0
					@jogadaExtra = true
				end
			end
		elsif jogada == 11 && jogadaExtra
			if @strike > 0
				@pontos += pins
			end
			if @spare > 0
				@pontos += pins
			end
			@pontos += pins
			@jogadaExtra = false
			@jogada = 12
		end
	end

	def score
		# return the current score
		if @pontos == 1
			puts "O score é #{pontos} ponto."
		elsif 
			puts "O score é #{pontos} pontos."
		end	
	end

	# Add code as needed
end


jogo = Bowling.new()
jogo.score
jogo.roll(1)
jogo.score
jogo.roll(4)
jogo.score
jogo.roll(4)
jogo.score
jogo.roll(5)
jogo.score
jogo.roll(6)
jogo.score
jogo.roll(4)
jogo.score
jogo.roll(5)
jogo.score
jogo.roll(5)
jogo.score
jogo.roll(10)
jogo.score
jogo.roll(0)
jogo.score
jogo.roll(1)
jogo.score
jogo.roll(7)
jogo.score
jogo.roll(3)
jogo.score
jogo.roll(6)
jogo.score
jogo.roll(4)
jogo.score
jogo.roll(10)
jogo.score
jogo.roll(2)
jogo.score
jogo.roll(8)
jogo.score
jogo.roll(6)
jogo.score