class Frame
	attr_reader :firstL, :secondL, :flagSituation, :bonus
	def initialize
		@firstL = -1
		@secondL = -1
		@flagSituation = "N" #Normal situation: N || Strike: ST || Spare: SP
		@bonus = -1
	end
	
	def rollFirstLaunch(pins)
		if(pins == 10) then @flagSituation = "ST" end
		@firstL = pins
	end
	
	def rollSecondLaunch(pins)
		if(@firstL + pins == 10) then @flagSituation = "SP" end
		@secondL = pins
	end
	
	def rollBonus(pins)
		@bonus = pins
	end
end

class Bowling
	attr_reader :frameList
	
	def initialize
		@frameList = []
	end
	
	# roll the desired number of pins
	def roll(pins)
		#::::::::::::::::::::::::::The number of pins test:::::::::::::::::::::::::::::
		if(pins < 0 or pins > 10)
			"ErrNoPins: Invalid number of pins"
		#::::::::::::::::::::::::::The first launch of the whole game::::::::::::::::::
		elsif(@frameList.size == 0)
			f = Frame.new
			f.rollFirstLaunch(pins)
			@frameList.push(f)
		#::::::::::::::::::::::::::The last frame of the game::::::::::::::::::::::::::		
		elsif(@frameList.size == 10)
			if(@frameList[9].flagSituation == "ST")
				if(@frameList[9].secondL == -1)
					@frameList[9].rollSecondLaunch(pins)
				elsif(@frameList[9].bonus == -1)
					@frameList[9].rollBonus(pins)
				else
					"ErrEndGame2: Game finished, your strike bonus finished"
				end
			elsif(@frameList[9].flagSituation == "SP")
				if(@frameList[9].bonus == -1)
					@frameList[9].rollBonus(pins)
				else
					"ErrEndGame3: Game finished, your spare bonus finished"
				end

			elsif(@frameList[9].flagSituation == "N")
				if(@frameList[9].firstL == -1)
					@frameList[9].rollFirstLaunch(pins)
				elsif(@frameList[9].secondL == -1)
					if(@frameList[9].firstL + pins <= 10)
						@frameList[9].rollSecondLaunch(pins)
					else
						"ErrInsertSecondLaunch: It's not possible to insert the pins you rolled."
					end
				else
					"ErrEndGame1: Game finished, you don't have bonus to play anymore"
				end
			end
			
		#::::::::::::::::::::::::::Insert the first launch:::::::::::::::::::::::::::::
		elsif(@frameList[@frameList.size - 1].firstL == -1)
			@frameList[@frameList.size - 1].rollFirstLaunch(pins)
			if(@frameList[@frameList.size - 1].flagSituation == "ST")
				f = Frame.new
				@frameList.push(f)
			end
		#::::::::::::::::::::::::::Insert the second launch:::::::::::::::::::::::::::
		elsif(@frameList[@frameList.size - 1].secondL == -1)
			if(@frameList[@frameList.size - 1].flagSituation == "ST")
				f = Frame.new
				f.rollFirstLaunch(pins)
				@frameList.push(f)
			elsif(@frameList[@frameList.size - 1].firstL + pins <= 10)
				@frameList[@frameList.size - 1].rollSecondLaunch(pins)
				f = Frame.new
				@frameList.push(f)
			else
				"ErrInsertSecondLaunch: It's not possible to insert the pins you rolled."
			end
		end
	end
	
	# return the current score
	def score
		index = 0
		total = 0
		
		while (index < @frameList.size)
			if(index == 9)
				if(@frameList[9].firstL != -1)
					total += @frameList[9].firstL
					if(@frameList[9].secondL != -1)
						total += @frameList[9].secondL
						if(@frameList[9].bonus != -1)
							total += @frameList[9].bonus
						end
					end
				end
			# Normal Situation::::::::::::::::::::::::::::::::::
			elsif(@frameList[index].flagSituation == "N")
				if (@frameList[index].firstL != -1)
					total += @frameList[index].firstL
					if (@frameList[index].secondL != -1)
						total += @frameList[index].secondL
					end
				end
			# Strike Situation::::::::::::::::::::::::::::::::::
			elsif(@frameList[index].flagSituation == "ST")
				total += 10
				if(@frameList[index + 1] != nil)
					if(@frameList[index + 1].flagSituation == "ST")
						total += 10
						
						if(index == 8 and @frameList[9].secondL != -1)
							total += @frameList[9].secondL
						
						elsif(@frameList[index + 2] != nil)
							total += @frameList[index + 2].firstL
						end
					elsif(@frameList[index + 1].firstL != -1)
						total += @frameList[index + 1].firstL
						if(@frameList[index + 1].secondL != -1)
							total += @frameList[index + 1].secondL
						end
					end
				end
			# Spare Situation::::::::::::::::::::::::::::::::::
			elsif(@frameList[index].flagSituation == "SP")
				total += 10
				if(@frameList[index + 1] != nil)
					if(@frameList[index + 1].firstL != -1)
						total += @frameList[index + 1].firstL
					end
				end
			end
			index += 1
		end
		total
	end
end
