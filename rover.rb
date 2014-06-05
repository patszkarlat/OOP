class Rover
	LOCATION = %w[N, E, S, W]										#LOCATION is a CONSTANT. Must be in capitals. Doesn't change!
	attr_accessor :x, :y, :location 						#%w turns each location in array into a string.

def initialize(x, y, location)
	@x = x
	@y = y
	@location = location
end

def nasa_commands(commands)
	commands.each_char do |command|															#each_char takes each input (L or R), processes it, then moves to the next one
		case command 
		when "L", "R" then pivot(command)
		when "M" then move
		else puts "EPIC FAIL!"
		end
	end
end
																															#comma means or when using case method
def pivot(change_direction)
	current_location = LOCATION.index(@location)
	if change_direction == "R"
		current_location += 1
	else
		current_location -= 1
	end
current_location = current_location % 4

@location = LOCATION[current_location]
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


