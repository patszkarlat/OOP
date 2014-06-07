class Rover
	LOCATION = %w[N, E, S, W]										#LOCATION is a CONSTANT. Must be in capitals. Doesn't change! Without it, we would have to define N, E, S, W each time it was needed.
	attr_accessor :x, :y, :location 						#%w turns each location in array into a string.

	def initialize(x, y, location)
		@x = x
		@y = y
		@location = location
	end

	def nasa_commands(commands)
		commands.each_char do |command|															#each_char takes each input (L or R), processes it, then moves to the next one
			case command 
			when "L", "R" then pivot(command)												#when L or R, it will pivot L or R(command)
			when "M" then move
			else puts "EPIC FAIL!"
			end
		end
	end
																																#comma means or when using case method
	def pivot(change_direction)
		# @location = LOCATION[(LOCATION.index(@location) + (change_direction == "R" ? 1 : -1)) % 4]
		current_location = LOCATION.index(@location) # 2
		if change_direction == "R"
			current_location += 1		#now facing west (turned 90 degrees right)
		else
			current_location -= 1
		end
		current_location = current_location % 4 #if the number is out of range (ie. it's a negative number or larger than 3, it resets it)

		@location = LOCATION[current_location] #get the nth item of the array of LOCATION constant and assign its value to the specific rover's location
	end

	def move
		case @location 
		when "N" then @y += 1
		when "E" then @x += 1
		when "S" then @y -= 1
		when "W" then @x -= 1
		end
	end

end


