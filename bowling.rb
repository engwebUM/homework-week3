class Bowling

	attr_reader :game

	def initialize ()
		@game = Array.new
		@rolls = 0
		@frame = 0
	end 

	def roll(pins) 
		#preserved invariants: 1) 2) 3)
		if (pins<=10 and pins <0 and @frames<=10) then


		else p "Não preserva os invariantes 1), 2) ou 3)"
		end	
		#preserved invariants: 3) e 4)
		if (...) then end

		#preserved invariants: 3) e 5)
		if (...) then end 
	end

	def score
		#Strike invariants

		#Spare invariants

		#regular play 

	end


	#extra methods

	
end







bowling = Bowling.new()
p "ruby hello"
p "oi"
p bowling.game