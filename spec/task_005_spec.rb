require './lib/task_005'

RSpec.describe 'parse_input(input_data)' do
  it ' parses input data ' do
    input = <<~INPUT
      0,9 -> 5,9
      8,0 -> 0,8
      9,4 -> 3,4
    INPUT

    lines = Task005.parse_input(input)

    expect(lines[0]).to have_attributes(
      point1: have_attributes(x: 0, y: 9),
      point2: have_attributes(x: 5, y: 9),
    )
    expect(lines[1]).to have_attributes(
      point1: have_attributes(x: 8, y: 0),
      point2: have_attributes(x: 0, y: 8),
    )
    expect(lines[2]).to have_attributes(
      point1: have_attributes(x: 9, y: 4),
      point2: have_attributes(x: 3, y: 4),
    )
  end
end

RSpec.describe 'calculate_answer(input_data)' do
  it 'it calculate how many values of diagram hash are greater than 2' do
    input = <<~INPUT
      0,1 -> 0,3
      0,3 -> 2,3
      2,3 -> 3,3
      0,2 -> 3,2
    INPUT

    answer = Task005.calculate_answer_005(input)

    expect(answer).to eq(3)
  end
end
