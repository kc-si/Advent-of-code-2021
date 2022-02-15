require './lib/task_005'

RSpec.describe 'calculate_answer(input_data)' do
  it 'it calculate how many values of diagram hash are greater than 2' do
    input = <<~INPUT
      0,1 -> 0,3
      0,3 -> 2,3
      2,3 -> 3,3
      0,2 -> 3,2
    INPUT

    answer = Task005.calculate_answer(input)

    expect(answer).to eq(3)
  end
end
