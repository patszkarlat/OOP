class Rover
	DIRECTIONS = %w[N E S W]										#DIRECTIONS is a CONSTANT. Must be in capitals. Doesn't change! Without it, we would have to define N, E, S, W each time it was needed.
	attr_accessor :x, :y, :direction 						#%w turns each location in array into a string.

	def initialize(x, y, direction)
		@x = x
		@y = y
		@direction = direction 
	end


	def nasa_commands(commands)
		commands.each do |command|													
			if command == "L" || command == "R"
				pivot(command)												
			elsif command == "M"														#elsif means otherwise
				move_rover
			else 
				puts "YOU SUCK!"														#else means 'this is last ditch effort'; else comes in at end.
			end
		end																							#first end completes if statement; second end completes do; last end completes def.
	end

def pivot(change_direction)
	current_direction = DIRECTIONS.index(@direction)
	if change_direction == "R"
		current_direction += 1  					#now facing EAST (turned 90 degrees)	
	else
		current_direction -= 1
	end
	#+= and -= refers one step in a certain direction.
																												#current_direction refers to ONE INDEX in N, E, S, W array.
																												#adding or minusing 1 will change the position.
																												#ex. if we were at N, told to go R, then we would change what index we're located in. In this case
																												#it would be one turn R, which would be facing EAST. [0, 1, 2, 3] = [N, E, S, W]




	current_direction = current_direction % 4
	#if number is larger than 4, if it is divisable evenly with no remainder aka % 4, then it resets to 0, aka N
	#if number is 5, 4/5 remainder one...look at array [0,1,2,3] 5 would be East or number 2.																	
	@direction = DIRECTIONS[current_direction]
	#returns new location value
end

def nice_format
	puts "#{@x}, #{@y}, #{@direction}"
end

def move_rover
	if @direction == "N" 
		@y += 1
	elsif @direction == "E"
	 	@x += 1
	elsif @direction == "S"
		@y -= 1
	elsif @direction == "W"
		@x -= 1
	else
		puts "WHAT THE FUCK?"
#elsif really means 'when' after 'if'
	end
end

position = Rover.new(1, 2, "N")
position.nasa_commands(["L", "M", "L", "M", "L", "M", "L", "M", "M"])
position.nice_format

rover2 = Rover.new(3, 3, "E")
rover2.nasa_commands("MMRMMRMRRM".split(''))
rover2.nice_format

#position could have been 'bananas', that word doesn't matter! But what follows . must be the method we are calling!! + (our arguments)












end