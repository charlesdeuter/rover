class Grid
    def initialize(x, y)
        @@x = x
        @@y = y
        @rovers = []
    end
    
    class Rover < Grid
        def initialize(x,y,dir)
            @x = x
            @y = y
            @dir = dir
        end

        def move
            case @dir
            when "N"
                if @y < @@y
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
                if @x < @@x
                    @x += 1
                end
            end
            p self
        end

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

    def addRover(x,y,dir)
        rover = Rover.new(x,y,dir)
        @rovers.push(rover)
    end

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

    attr_accessor :x
    
    attr_accessor :y
    
    attr_accessor :rovers

    def coords
        puts "x : #{@@x}"
        puts "y : #{@@y}"
        @rovers.each do |rover|
            p rover
        end
    end
end

grid = Grid.new(5,5)
grid.addRover(1,2, "N")
grid.commandRover(0, "LMLMLMLMM")
grid.addRover(3,3, "E")
grid.commandRover(1, "MMRMMRMRRM")


grid.coords