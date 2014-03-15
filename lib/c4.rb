class Grid
  attr_reader :size, :spaces

  @@directions = {'N' => 'self_e - @size', 'S' => 'self_e + @size', 'W' => 'self_e - 1', 'E' => 'self_e + 1',
              'NW' => 'self_e - (@size-1)', 'NE' => 'self_e - (@size + 1)', 'SW' => 'self_e + (@size -1)',
              'SE' => 'self_e + (@size + 1)',
              #upper level of numbers
              'UN' => 'self_e - @size - (@size**2)', 'US' => 'self_e + @size - (@size**2)', 'UW' => 'self_e - 1 - (@size**2)', 'UE' => 'self_e + 1 - (@size**2)',
              'UNW' => 'self_e - (@size-1) - (@size**2)', 'UNE' => 'self_e - (@size + 1) - (@size**2)', 'USW' => 'self_e + (@size -1) - (@size**2)',
              'USE' => 'self_e + (@size + 1) - (@size**2)', 'UC' => 'self_e -(@size**2)',
              #lower level of numbers
              'LN' => 'self_e - @size + (@size**2)', 'LS' => 'self_e + @size + (@size**2)', 'LW' => 'self_e - 1 + (@size**2)', 'LE' => 'self_e + 1 + (@size**2)',
              'LNW' => 'self_e - (@size-1) + (@size**2)', 'LNE' => 'self_e - (@size + 1) + (@size**2)', 'LSW' => 'self_e + (@size -1) + (@size**2)',
              'LSE' => 'self_e + (@size + 1) + (@size**2)', 'LC' => 'self_e + (@size**2)'}

  def initialize(size)
    @size = size
    @spaces = Array(0...(size*size*size))
  end

  def make_active(cells)
      cells.each do |cell|
        @spaces[cell] = '*'
    end
  end

  def neighbor_check(self_e)
    neighbor_count = 0
    @@directions.each do|key, value|
      if @spaces[eval(value)] == '*'
        neighbor_count += 1
      else
        neighbor_count = neighbor_count
      end
    end
    neighbor_count
  end
end

