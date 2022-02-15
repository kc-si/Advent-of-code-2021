require './lib/task_005a'

RSpec.describe 'parse_input(input_data)' do
  it ' parses input data ' do
    input = <<~INPUT
      0,9 -> 5,9
      8,0 -> 0,8
      9,4 -> 3,4
    INPUT

    lines = Task005.parse_input(input)

    expect(lines.map(&:class)).to eq(
      [
        Task005::Line,
        Task005::Line,
        Task005::Line,
      ],
    )
  end
end

RSpec.describe 'calculate_answer_005a(diagram)' do
  it 'it calculate how many values of diagram hash are greater than 2' do
    input = <<~INPUT
      0,1 -> 0,3
      0,3 -> 2,3
      2,3 -> 3,3
      0,2 -> 3,2
      0,1 -> 3,4
    INPUT

    answer = Task005.calculate_answer_005a(input)

    expect(answer).to eq(5)
  end
end
