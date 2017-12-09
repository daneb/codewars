class MazeRunner
  SAFE_TO_WALK = 0
  WALL = 1
  START_POINT = 2
  END_POINT = 3
  NORTH = "N"
  WEST = "W"
  SOUTH = "S"
  EAST = "E"

  attr_accessor :current_position

  def initialize(maze, directions)
    @maze = maze
    @directions = directions
  end

  def maze_runner
    start_location = find_location(START_POINT)
    @current_position = start_location
    traverse_maze_with_directions
  end

  def traverse_maze_with_directions
    status = "Lost"
    @directions.each { |direction|
      next_position = navigate(direction)
      if gone_outside_a_wall?(next_position) or  hit_a_wall?(next_position)
        status = "Dead"
      elsif at_end?(next_position)
        status = "Finish"
      else
        @current_position = next_position
      end
      break if status == "Finish" or status == "Dead"
    }
    status
  end

  def gone_outside_a_wall?(next_position)
    row, column = next_position
    return true if row < 0 or row >= @maze.length
    return true if column < 0 or column >= @maze[0].length
    false
  end

  def hit_a_wall?(next_position)
    row, column = next_position
    next_move_contains = @maze[row][column]
    return true if next_move_contains == WALL
    false
  end

  def at_end?(next_position)
    row, column = next_position
    next_move_contains = @maze[row][column]
    return true if next_move_contains == END_POINT
    false
  end

  def navigate(next_direction)
    next_position = @current_position
    case next_direction
    when NORTH
      next_position[0] = next_position[0] - 1
    when WEST
      next_position[1] = next_position[1] - 1
    when EAST
      next_position[1] = next_position[1] + 1
    when SOUTH
      next_position[0] = next_position[0] + 1
    end
    next_position
  end

  def find_location(point)
    location = []
    @maze.each_with_index { |row, row_index|
      column_index = row.index(point)
      if column_index
        location = [ row_index, column_index ]
        break
      end
    }
    location
  end
end