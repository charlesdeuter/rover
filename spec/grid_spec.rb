require 'spec_helper'

# spec/grid_spec.rb
describe Grid do
    before do
        @grid = Grid.new(5,5)
        @grid.addRover(1,2, "N")
        @grid.commandRover(0, "LMLMLMLMM")
        @grid.addRover(3,3, "E")
        @grid.commandRover(1, "MMRMMRMRRM")
    end

    it "should return the coords and dir of rover 1" do
        rover = @grid.rovers[0]
        expect(rover.x).to eql(1)
        expect(rover.y).to eql(3)
        expect(rover.dir).to eql("N")
    end

    it "should return the coords and dir of rover 2" do
        rover = @grid.rovers[1]
        expect(rover.x).to eql(5)
        expect(rover.y).to eql(1)
        expect(rover.dir).to eql("E")
    end
end