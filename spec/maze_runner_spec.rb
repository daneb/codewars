require './maze_runner'

describe MazeRunner do
  # row is index in array maze
  # column is row index and column index in row
  #         N = 5,1                 N (row -1 1, same_column)
  #  W = 6,0    6,1     E = 6,2 (same row, column - 1), (same row, column + 2)
  #         S = 7,1 (row + 1, same_column)
  maze = [[1,1,1,1,1,1,1],
          [1,0,0,0,0,0,3],
          [1,0,1,0,1,0,1],
          [0,0,1,0,0,0,1],
          [1,0,1,0,1,0,1],
          [1,0,0,0,0,0,1],
          [1,2,1,0,1,0,1]]
  direction = ["N","N","N","N","N","E","E","E","E","E"]
  subject { MazeRunner.new(maze, direction) }

  it 'will determine the result of the maze run' do
    result = subject.maze_runner
    expect(result).to eq 'Finish'
  end

  it 'determines start location in maze' do
    START_POINT = 2
    result = subject.find_location(START_POINT)
    expect(result).to eq [6, 1]
  end

  it 'determines end location in maze' do
    END_POINT = 3
    result = subject.find_location(END_POINT)
    expect(result).to eq [1, 6]
  end

  it 'determines the position in the maze with North direction' do
    subject.current_position = [6, 1]
    expect(subject.navigate("N")).to eq [5, 1]
  end

  it 'determines the position in the maze with West direction' do
    subject.current_position = [6, 1]
    expect(subject.navigate("W")).to eq [6, 0]
  end

  it 'determines the position in the maze with East direction' do
    subject.current_position = [6, 1]
    expect(subject.navigate("E")).to eq [6, 2]
  end

  it 'determines the position in the maze with South direction' do
    subject.current_position = [6, 1]
    expect(subject.navigate("S")).to eq [7, 1]
  end
end

describe MazeRunner do
  maze = [[1,1,1,1,1,1,1],
          [1,0,0,0,0,0,3],
          [1,0,1,0,1,0,1],
          [0,0,1,0,0,0,1],
          [1,0,1,0,1,0,1],
          [1,0,0,0,0,0,1],
          [1,2,1,0,1,0,1]]
direction = ["N","N","N","N","N","E","E","S","S","S","S","S","S"]
subject { MazeRunner.new(maze, direction) }

it 'determines the position for a maze run that leads to death' do
  result = subject.maze_runner
  expect(result).to eq 'Dead'
end

end