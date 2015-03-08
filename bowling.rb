class Frame
	attr_reader :lance1
	attr_reader :lance2
	attr_reader :numero_da_frame
	attr_reader :estado

	def initialize(frame)
		@lance1
		@lance2
		@total
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

	def is_strike ()
		if (@lance1!=nil)
			if @lance1== 10
			then return 1
			else return 0
			end
		end
	end

	def is_spare()
		if(@lance1!=nil and @lance2!=nil)
		then
			if @lance1+@lance2 == 10
			then return 1
			else return 0
			end
		end
		return 0
	end

	def is_jogada_normal()
		if(@lance1!=nil and @lance2!=nil)
			if @lance1+@lance2 < 10
			then return 1
			else return 0
			end
		end
		return 0 
	end

	def e_dos_ultimos(posicao)
		res=0
		if (@numero_da_frame==posicao or @numero_da_frame==posicao-1)
		then 
			if(@lance1!=nil)then res=1 end
		end
		return res
	end

	def total()
		res =0
		i=0
		if (@lance1!= nil and @lance2!= nil and i==0) then res+= (@lance1+@lance2);i=1 end
		if (@lance1!= nil and i==0) then res+= @lance1;i=1 end
		return res
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
		if (@total_frames<12)
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
		total=0
		posicao=0
		@lista_frame.each do |frame|
			i=0
			if (frame!=nil and posicao <10)
			then
				#strike			
				if (frame.is_strike() ==1 and i==0)
				then 
					if (lista_frame[posicao+1].is_strike) 
					then 
						if lista_frame[posicao+1].is_strike ==1
						then total += (frame.total() + (lista_frame[posicao+1]).lance1 + (lista_frame[posicao+2]).lance1)
						else total += (frame.total() + (lista_frame[posicao+1]).lance1 + (lista_frame[posicao+1]).lance2)
						end
					else total +=frame.total()
					end 
					p total
					posicao+=1
					i=1
				end
				#spare 
				if (frame.is_spare() ==1 and i==0) 
				then 

					if (lista_frame[posicao+1]!=nil) 
					then total += (frame.total() + (lista_frame[posicao+1]).lance1)
					else total +=frame.total()
					end 

					p total
					i=1
					posicao+=1

				end

				#normal
				if (frame.is_jogada_normal() ==1 and i==0)
				then 
					total +=frame.total()
					p total
					i=1
					posicao+=1

				end
				#ultimos
				if (frame.e_dos_ultimos(@lista_frame.size) ==1 and i==0)
				then 
					total +=frame.total()
					p total
					i=1
					posicao+=1

				end
			end
		end
		return total
	end

end
