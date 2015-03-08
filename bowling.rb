class Frame
	attr_reader :firstLaunch, :secondLaunch, :specialThirdLaunch, :strikebonus, :sparebonus
	
	def initialize
		@firstLaunch = -1
		@secondLaunch = -1
		@specialThirdLaunch = -1
		@strikebonus = 0 # Flag
		@sparebonus = 0 # Flag
	end
		
	def setFirstLaunch(pins)
		if pins == 10 then @strikebonus = 1 end
		@firstLaunch = pins
	end
		
	def setSecondLaunch(pins)
		if pins + @firstLaunch == 10
			@sparebonus = 1
		end
		@secondLaunch = pins
	end
	
	def setThirdLaunch(pins)
		@specialThirdLaunch = pins
	end
end

class Bowling
	attr_reader :frames, :actualFrame
	
	def initialize
		@frames = []
		@actualFrame = 0
	end

	def roll(pins) # roll the desired number of pins
		errorcode = 0
		if (pins < 0 or pins > 10)
			errorcode = 1			
			#puts 'Error: Invalid number of pins'
		
		#Last frame case
		elsif (@actualFrame == 9)
			if (@frames[9].strikebonus == 1)
				if (@frames[9].secondLaunch == -1)
					@frames[9].setSecondLaunch(pins)
				elsif (@frames[9].specialThirdLaunch == -1)
					@frames[9].setThirdLaunch(pins)
				else
					errorcode = 2					
					#puts 'The game is finished. No more launchs.'
				end
			elsif (@frames[9].sparebonus == 1)
				if (@frames[9].specialThirdLaunch == -1)
					@frames[9].setThirdLaunch(pins)
				else
					errorcode = 2					
					#puts 'The game is finished. No more launchs.'
				end
			else
				if (@frames[9].firstLaunch == -1)
					@frames[9].setFirstLaunch(pins)
				elsif (@frames[9].secondLaunch == -1)
					if (@frames[9].firstLaunch + pins <= 10)
					@frames[9].setSecondLaunch(pins)						
					else
						errorcode = 3
						#puts 'Error: The number of pins you want to add is incorrect.'
					end
				else
					errorcode = 2
					#puts 'The game is finished. No more launchs.'
				end
			end
		#The number of frames is lower than 10
		else
			#First Frame
			if (@actualFrame == 0)		
			
				if(@frames.size == 0)
					fr = Frame.new
					fr.setFirstLaunch(pins)
					@frames.push(fr)					
					
				elsif(@frames[0].firstLaunch == 10)
					createFrame(pins)
				elsif(@frames[0].secondLaunch == -1)
					if(@frames[0].firstLaunch + pins <= 10)
					@frames[0].setSecondLaunch(pins)						
					fr = Frame.new
					@frames.push(fr)
					@actualFrame += 1
					else
						errorcode = 4
						#puts 'The number of pins dropped in the frame exceeded the limit of 10'
					end
				else
					createFrame(pins)
				end
			elsif (@frames[@actualFrame].firstLaunch == -1)
				@frames[@actualFrame].setFirstLaunch(pins)
			elsif (@frames[@actualFrame].firstLaunch == 10)
				createFrame(pins)
			elsif (@frames[@actualFrame].secondLaunch == -1)
				if (@frames[@actualFrame].firstLaunch + pins <= 10)
					@frames[@actualFrame].setSecondLaunch(pins)
					fr = Frame.new
					@frames.push(fr)
					@actualFrame += 1
				else
					errorcode = 4
					#puts 'The number of pins dropped in the frame exceed the limit of 10'
					
				end
			else
				createFrame(pins)
			end
		end
		errorcode
	end
	
	def createFrame(pins)
		fr = Frame.new
		fr.setFirstLaunch(pins)
		@frames.push(fr)
		@actualFrame += 1
	end
	
	def score
		index = 0
		result = 0

		(@frames.size).times do		
		
			#The special 10th frame
			if(index == 9)				
				if (@frames[9].firstLaunch != -1)	
					result += @frames[9].firstLaunch
					if (@frames[9].secondLaunch != -1)
						result += @frames[9].secondLaunch
						if (@frames[9].specialThirdLaunch != -1)
							result += @frames[9].specialThirdLaunch	
						end
					end				
				end
			#The Strike case	
			elsif (@frames[index].strikebonus == 1)
				result += 10
				if (@frames[index + 1] != nil)				
					if (@frames[index + 1].firstLaunch != -1)
						result += @frames[index + 1].firstLaunch
						if (@frames[index + 1].strikebonus == 1)
							if (@frames[index + 2] != nil)
								if (@frames[index + 2].firstLaunch != -1)
									result += @frames[index + 2].firstLaunch
								end
								
								
							elsif (index == 8)
								if (@frames[index + 1].secondLaunch != -1)
									result += @frames[index + 1].secondLaunch
								end
							end
						
						elsif (@frames[index + 1].secondLaunch != -1)
							result += @frames[index + 1].secondLaunch
						end
					end
				end
			#The Spare case
			elsif (@frames[index].sparebonus == 1)				
				result += 10
				if (@frames[index + 1] != nil)
					if (@frames[index + 1].firstLaunch != -1)
						result += @frames[index + 1].firstLaunch
					end
				end
			#The normal case
			else
				if (@frames[index].firstLaunch != -1)
					result += @frames[index].firstLaunch
				end
				if (@frames[index].secondLaunch != -1)
					result += @frames[index].secondLaunch
				end
			end
			index += 1
		end
		result
	end

	def run(pins)
		roll(pins)
	end
end

#Prints the bowling rolls
=begin
game.frames.each do |f|
	puts "| #{f.firstLaunch} | #{f.secondLaunch} | #{f.specialThirdLaunch} |"
end
=end
