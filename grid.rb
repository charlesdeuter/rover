class Grid
    attr_accessor :x, :y, :rovers

    # create a new grid
    def initialize(x, y)
        @x = x
        @y = y
        @rovers = []
    end

    # locate a rover within the crig
    def addRover(x,y,dir)
        rover = Rover.new(x,y,dir,self)
        @rovers.push(rover)
    end

    # command the rover using a string consisting of single char commands
    def commandRover(roverIndex, commands)
        rover = @rovers[roverIndex]
        commands.chars.to_a.each do |command|
            case command
            when "L"
                rover.turnLeft
            when "R"
                rover.turnRight
            when "M"
                rover.move
            else
                puts "invalid input"
            end
        end
    end
end

class Rover
    attr_accessor :x, :y, :dir

    #create a new rover
    def initialize(x,y,dir,grid)
        @x = x
        @y = y
        @dir = dir
        @grid = grid
    end

    # move the rover
    def move
        case @dir
        when "N"
            if @y < @grid.y
                @y += 1
            end
        when "S" 
            if @y > 0
                @y -= 1
            end
        when "W" 
            if @x > 0
                @x -= 1
            end
        when "E" 
            if @x < @grid.x
                @x += 1
            end
        end
    end

    # turn right
    def turnRight
        case @dir
        when "N"
            @dir = "E"
        when "S"
            @dir = "W"
        when "W"
            @dir = "N"
        when "E"
            @dir = "S"
        end
    end

    # turn left
    def turnLeft
        case @dir
        when "N"
            @dir = "W"
        when "S"
            @dir = "E"
        when "W"
            @dir = "S"
        when "E"
            @dir = "N"
        end
    end
end