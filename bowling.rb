 class Bowling
	 attr_accessor :rolls
	 # Initialized array to storage rolls
	 def initialize 
		 @rolls = []
	 end
	
	# # size/2 dá o frame onde está livre
	# # size/2*2 dá primeiro ligar do frame que está livre
	# # @rolls.length - 1o ligar livre
	def roll (pins)
		size = @rolls.length
		frame = (size)/2
		# ainda nao chegamos ao fim dos 10 frames
		if frame < 10
			# se a 1a posição lire é igual à 1a posição do 1o frame que está livre
			if ((size/2)*2) == size
				if pins == 10
					@rolls.push pins
					@rolls.push 0
				elsif pins >= 0 && pins <= 9
					@rolls.push pins
				else
					raise ArgumentError, 'ERROR: **** Incorrect number of pins. ****'
				end
			elsif (pins + @rolls[size/2*2]) >= 0 && (pins + @rolls[size/2*2]) <= 10 && pins >= 0 && pins <= 10
					@rolls.push pins
			else
					raise ArgumentError, 'ERROR: **** Incorrect number of pins. ****'
			end
		elsif frame == 10 && size == 20
			if @rolls[18] == 10 || @rolls[18] + @rolls[19] == 10
				if pins == 10
					@rolls.push pins
					@rolls.push 0
				elsif pins >= 0 && pins <= 9
					@rolls.push pins
				else
					raise ArgumentError, 'ERROR: **** Incorrect number of pins. ****'
				end
			else
				raise ArgumentError, 'ERROR: **** Incorrect play. ****'
			end
		elsif frame == 10 && size == 21
			if @rolls[18] == 10
				if pins == 10
					@rolls.push pins
					@rolls.push 0
				elsif pins >= 0 && pins <= 9
					@rolls.push pins
				else
				raise ArgumentError, 'ERROR: **** Incorrect number of pins. ****'
				end
			else
				raise ArgumentError, 'ERROR: **** Incorrect play. ****'
			end
		elsif frame == 11 && @rolls[18] == 10 && @rolls[20] == 10 
			if pins == 10
				@rolls.push pins
				@rolls.push 0
			elsif pins >= 0 && pins <= 9
				@rolls.push pins
			else
				raise ArgumentError, 'ERROR: **** Incorrect number of pins. ****'
			end
		else
			raise ArgumentError, 'ERROR: **** No more plays. Game is Over. ****'
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