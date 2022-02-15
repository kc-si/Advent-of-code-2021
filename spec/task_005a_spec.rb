require './lib/task_005a'

RSpec.describe 'calculate_answer_005a(diagram)' do
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
