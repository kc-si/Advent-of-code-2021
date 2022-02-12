require './lib/task_005a'

RSpec.describe 'parse_input(input_data)' do
  it ' parses input data ' do
    input = <<~INPUT
      0,9 -> 5,9
      8,0 -> 0,8
      9,4 -> 3,4
    INPUT

    lines = Task005a.parse_input(input)

    expect(lines).to eq(
      [
        { point1: [0, 9], point2: [5, 9] },
        { point1: [8, 0], point2: [0, 8] },
        { point1: [9, 4], point2: [3, 4] },
      ],
    )
  end
end

RSpec.describe 'parse_line(value)' do
  it ' parses input data prcessing ( parses one line )' do
    input = '0,9 -> 5,9'

    line = Task005a.parse_line(input)

    expect(line).to eq(
      { point1: [0, 9], point2: [5, 9] },
    )
  end
end

RSpec.describe 'mark_lines(lines, diagram)' do
  it 'marks how many horizontal, vertical or 45 degrease lines cross over the point on diagram' do
    lines =
      [
        { point1: [0, 1], point2: [0, 2] },
        { point1: [1, 0], point2: [4, 3] },
        { point1: [6, 8], point2: [8, 6] },
        { point1: [8, 8], point2: [7, 7] },
        { point1: [0, 2], point2: [3, 3] },
      ]

    diagram = Task005a.mark_lines(lines)

    expect(diagram).to eq(
      {
        [0, 1] => 1,
        [0, 2] => 1,
        [1, 0] => 1,
        [2, 1] => 1,
        [3, 2] => 1,
        [4, 3] => 1,
        [6, 8] => 1,
        [7, 7] => 2,
        [8, 6] => 1,
        [8, 8] => 1,
      },
    )
  end
end

RSpec.describe 'mark_line(line, diagram)' do
  it 'mark 1 line on diagram' do
    line = { point1: [6, 8], point2: [8, 6] }
    diagram = {}

    diagram = Task005a.mark_line(line, diagram)

    expect(diagram).to eq(
      {
        [6, 8] => 1,
        [7, 7] => 1,
        [8, 6] => 1,
      },
    )
  end
end

RSpec.describe 'calculate_answer(diagram)' do
  it 'it calculate how many values of diagram hash are greater than 2' do
    input = <<~INPUT
      0,1 -> 0,3
      0,3 -> 2,3
      2,3 -> 3,3
      0,2 -> 3,2
      0,1 -> 3,4
    INPUT

    answer = Task005a.calculate_answer(input)

    expect(answer).to eq(5)
  end
end
