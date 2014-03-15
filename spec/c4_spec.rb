require 'rspec'
require 'c4'

describe Grid do
  describe 'initialize' do
    it 'initializes the game board' do
      test_grid = Grid.new(3)
      test_grid.should be_an_instance_of Grid
    end

    it 'makes a grid with the specified number of spaces' do
      test_grid = Grid.new(3)
      test_grid.spaces.length.should eq 27
    end
  end

  describe 'make_active' do
    it 'toggles an array of cells from a number to *' do
      test_grid = Grid.new(3)
      test_grid.make_active([3])
      test_grid.spaces[3].should eq '*'
    end

    it 'makes an array of toggled cells' do
      test_grid = Grid.new(3)
      test_grid.make_active([3,4,5])
      test_grid.spaces[4].should eq '*'
    end
  end

  # describe 'remove_numbers' do
  #   it 'changes all unmarked cells (initialized as numbers) to "-"s' do
  #     test_grid = Grid.new(3)
  #     test_grid.make_active([0,1,3,4,5])
  #     test_grid.remove_numbers
  #     test_grid.spaces.should eq ["*","*","-","*","*","*","-","-","-"]
  #   end
  # end

  describe 'neighbor_check' do
    it 'returns the number of neighbors a cell has alive' do
      test_grid = Grid.new(3)
      test_grid.make_active([0,1,3,7,17,23,26])
      test_grid.neighbor_check(13).should eq 7
    end
  end
end

