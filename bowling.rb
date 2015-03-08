	class Jogada
		attr_accessor:first_game, :second_game, :points, :strike, :spare

		def initialize
			@first_game = 0 
			@second_game = 0
			@points = 0
			@strike = 0
			@spare = 0
			
		end	

		def insert(pins, attempts)
			if attempts == 1
				@first_game = pins
			else @second_game = pins
			end	
		end			
	end

	class Bowling
		attr_accessor:jogadas, :index, :attempts, :totalPoints

		def initialize
			@jogadas = Array.new()
			@index = 0
			@attempts = 1
			
			@totalPoints = 0
		end



	  	def roll(pins)
	  		check=0
	    	if @index <= 10
	    		if @attempts == 1
	    			if pins == 10
	    				jogada = Jogada.new()
	    				jogada.insert(pins,@attempts)
	    				@jogadas.insert(@index,jogada)
	    				@jogadas.at(@index).strike +=1
	    				@index += 1
	    				
	    			else
	    				jogada = Jogada.new()
	    				jogada.insert(pins,@attempts)
	    				@jogadas.insert(@index,jogada)
	    				@attempts = 2
	    				
	    			end
	    		elsif @jogadas.at(@index).first_game + pins == 10
	    		 	@jogadas.at(@index).spare +=1
	    		 	@jogadas.at(@index).insert(pins,@attempts)
	    		 	@attempts=1
	    		 	@index += 1
	    		 	
	    		else 
	    		  	@jogadas.at(@index).insert(pins,@attempts)
	    		  	@attempts=1
	    		  	@index += 1
	    		  		
	    		end

	    	elsif  @index==11 && @jogadas.at(10).spare == 1
	    		jogada = Jogada.new()
	    		jogada.insert(pins,@attempts)
	    		@jogadas.insert(11,jogada)

	    	elsif @index==11 && @jogadas.at(10).strike == 1 && @attempts == 1
	    		jogada = Jogada.new()
	    		jogada.insert(pins,@attempts)
	    		@jogadas.insert(11,jogada)
	    		@attempts = 2
	    	elsif @index==11 && @jogadas.at(10).strike == 1	&& @attempts == 2
	    		@jogadas.at(@index).second_game = pins
	    	else check = 0
	    	end	

	    	check = 1
	    	return check
	    end	


	  	def score
	    	# return the current score
	    	#points
	    	i = 0
	    	res = 0

	    	while i < @jogadas.size()
	    		
				if @jogadas.at(i).strike > 0
    				@jogadas.at(i).points = @totalPoints + @jogadas.at(i).first_game  + @jogadas.at(i).second_game + @jogadas.at(i+1).first_game  + @jogadas.at(i+1).second_game 
				elsif jogadas.at(i).spare > 0
					@jogadas.at(i).points = @totalPoints + @jogadas.at(i).first_game + @jogadas.at(i+1).first_game + @jogadas.at(i).second_game
				else @jogadas.at(i).points = @totalPoints + @jogadas.at(i).first_game + @jogadas.at(i).second_game
				end
				@totalPoints = @jogadas.at(i).points
				i += 1
			end

			if @jogadas.size>10
			if @jogadas.at(10).strike = 1
				@jogadas.at(10).points = @totalPoints + @jogadas.at(11).first_game + @jogadas.at(11).second_game
			elsif @jogadas.at(10).spare = 1
				@jogadas.at(10).points = @totalPoints + @jogadas.at(11).first_game
			end
			@totalPoints = @jogadas.at(10).points
			end	
			res = @totalPoints
			return res 
	  	end

	  	
	    # Add code as needed
	end

		
		
