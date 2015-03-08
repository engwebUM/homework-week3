class Bowling

	attr_accessor :rolls

	# Initialized array to storage rolls
	def initialize 
		@rolls = []
	end
	
	# add roll to rolls 
	def roll(pins)
		if pins == 10
			@rolls.push pins
			@rolls.push 0
		else
			@rolls.push pins
		end
	end

	# Score - return the score on 'pontos' variable
	# Can return the score at any time, in the middle of a frame or uncomplete game
	def score
		pontos = 0
		index = 0
		while (index < 20 && @rolls[index]) do
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
		if @rolls[index + 2]
			if @rolls[index + 2] == 10
				if @rolls[index + 4]
					10 + 10 + @rolls[index + 4]
				else
					10 + 10
				end
			else
				if @rolls[index + 3]
					10 + @rolls[index + 2] + @rolls[index + 3]
				else
					10 + @rolls[index + 2]
				end
			end	
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
