#
#		REGRAS DO JOGO RESUMIDAS
#
# - 10 frames maximo

	# - cada frame tem 2 tentativas
		# - nas duas jogadas pode no máximo deitar abaixo 10 pinos
		
	# - cada frame tem um score = pinos derrubados + bonus de strike + bonus de spare
		# - spare é quando: na soma das duas tentativas, derruba 10 pinos
			# - acontece: soma um bonus
				# - bonus = pinos derrubados na tentative seguinte (primeira tentativa do frame seguinte)
		# - strike é quando: na primeira tentativa do frame, derruba 10 pinos
			# - acontece: soma um bonus
				# - bonus = soma da primeira e segunda tentativa do frame seguinte
				
# - se no 10 frame houver um strike:
	# - pode jogar um frame 11 com 2 tentativas
	
# - se no 10 frame houver um spare:
	# - pode jogar um frame 11 com 1 tentativa



class Bowling

	attr_accessor :rolls

	# Initialized array to storage rolls
	def initialize 
		@rolls = []
	end
	
	# roll funciont adds
	def roll(pins)
		# add pins to the end of rolls array
		if pins == 10
			@rolls.push pins
			@rolls.push 0
		else
			@rolls.push pins
		end
	end

	# Score - dá a pontuação por frame - não dá para ver a meio do frame, ou se tiver jogadas por completar.
	# lets start by initializing one counter and one index to navigate rolls
	# Ther create a loop that runs rolls array, returning the score on 'pontos'
	# After the loops, if it exists, he adds the "11th frame"
	def score
		pontos = 0
		index = 0

		while (index < 21 && @rolls[index]) do
			if strike? index
				pontos += pontosStrike (index)
			elsif spare? index
				pontos += pontosSpare (index)
			elsif @rolls[index + 1]
				pontos += @rolls[index] + @rolls[index + 1]
			else
				pontos += @rolls[index]
			end
			index += 2
		end
		
		
		
		
		pontos
	end

	# return true if it's a strike
	def strike? index
		@rolls[index] == 10
	end
	
	# return true if it's a spare
	def spare? index
		if @rolls[index + 1 ]
			@rolls[index] + @rolls[index + 1] == 10
		end
	end
	
	# return score to add, if Strike
	def pontosStrike index
		if @rolls[index + 3]
			10 + @rolls[index + 2] + @rolls[index + 3]
		elsif @rolls[index + 2]
			10 + @rolls[index + 2]
		else
			10
		end
	end
	
	# return score to add, if Spare
	def pontosSpare index
		if @rolls[index + 1]
			10 + @rolls[index + 1]
		else
			10
		end
	end
  
end
