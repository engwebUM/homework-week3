class Frame
	attr_reader :lance1
	attr_reader :lance2
	attr_reader :numero_da_frame
	attr_reader :estado

	def initialize(frame)
		@lance1
		@lance2
		@numero_da_frame=frame
		@estado=1 # 1-aberto   0-fechado
	end 

	def adiciona_lance(lance)
		#verificar se é um frame valido 
		i=0
		if (@lance1==nil and @estado==1 and lance==10 and i==0) then @lance1=lance; @estado=0; i=1 end
		if (@lance1==nil and @estado==1 and i ==0) then @lance1=lance; i=1 end
		if (@lance1!=nil and @lance2==nil and @estado==1 and @lance1+lance<=10 and i==0)then @lance2=lance; @estado=0; i=1  end
	end

	def ainda_Aberta (lance)
		return estado
	end
end


class Bowling
	attr_reader :lista_frame

	def initialize ()
		@lista_frame=Array.new(12)
		@total_frames = 0
	end

	def roll(pins)
		i=0 
		if (@total_frames<=10)
		then
			#frame com o primeiro elemento 10
			if ((@lista_frame[@total_frames])!=nil and (@lista_frame[@total_frames]).lance1==10 and i==0)
			then 
				@total_frames+=1
				f = Frame.new(@total_frames+1)
				f.adiciona_lance(pins)
				@lista_frame[@total_frames]=f
				i=1
			end

			#frame vazio
			if ((@lista_frame[@total_frames])==nil and i==0)
			then 
				f = Frame.new(@total_frames+1)
				f.adiciona_lance(pins)
				@lista_frame[@total_frames]=f
				i=1
			end

			#frame com o primeiro elemento != 10
			if ((@lista_frame[@total_frames])!=nil and (@lista_frame[@total_frames]).lance1<10 and i ==0)
			then 
				(@lista_frame[@total_frames]).adiciona_lance(pins)
				@total_frames+=1
				i = 1
			end	

			#frame com 2 elementos
			if ((@lista_frame[@total_frames])!=nil and (@lista_frame[@total_frames]).lance1<10 and i==0)
			then 
				@total_frames+=1
				f = Frame.new(@total_frames+1)
				f.adiciona_lance(pins)
				@lista_frame[@total_frames]=f
				i=1
			end
		end
end

	def score
	end

end



b = Bowling.new

b.roll(10)

b.roll(2)
b.roll(3)

b.roll(5)
b.roll(5)

b.roll(2)
b.roll(3)

b.roll(3)
b.roll(3)

p b.lista_frame
