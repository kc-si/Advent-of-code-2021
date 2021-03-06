require './lib/task_003a'

RSpec.describe 'parse_input(input_data) - input data processing:' do
  it ' short input_data to binary_diagnostic_report' do
    input_data = "100000101101\n011011010101\n000000111000\n110101110111\n110000001100\n"

    binary_diagnostic_report = Task003a.parse_input(input_data)

    expect(binary_diagnostic_report).to eq([['1', '0', '0', '0', '0', '0', '1', '0', '1', '1', '0', '1'],
      ['0', '1', '1', '0', '1', '1', '0', '1', '0', '1', '0', '1'],
      ['0', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '0'],
      ['1', '1', '0', '1', '0', '1', '1', '1', '0', '1', '1', '1'],
      ['1', '1', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0']])
  end
end

RSpec.describe 'bit_criteria - calculate one output number by bit criteria:' do # RSpec. not neccecery
  it ' with empty inputs' do
    binary_diagnostic_report = [['']]
    common = ''

    binary_report = Task003a.bit_criteria(binary_diagnostic_report, common)

    expect(binary_report).to eq('')
  end

  it ' with empty raport and common: most' do
    binary_diagnostic_report = [['']]
    common = 'most'

    binary_report = Task003a.bit_criteria(binary_diagnostic_report, common)

    expect(binary_report).to eq('')
  end

  it ' 1 number in raport and common: most' do
    binary_diagnostic_report = [['1', '0', '0', '0', '0', '0', '1', '0', '1', '1', '0', '1']]
    common = 'most'

    binary_report = Task003a.bit_criteria(binary_diagnostic_report, common)

    expect(binary_report).to eq('100000101101')
  end

  it ' 2 numbers in raport and common: most' do
    binary_diagnostic_report = [['1', '0', '0', '0', '0', '0', '1', '0', '1', '1', '0', '1'],
      ['0', '1', '1', '0', '1', '1', '0', '1', '0', '1', '0', '1']]
    common = 'most'

    binary_report = Task003a.bit_criteria(binary_diagnostic_report, common)

    expect(binary_report).to eq('100000101101')
  end

  it ' 10 numbers in raport and common: most' do
    binary_diagnostic_report = [['1', '0', '0', '0', '0', '0', '1', '0', '1', '1', '0', '1'],
      ['0', '1', '1', '0', '1', '1', '0', '1', '0', '1', '0', '1'],
      ['0', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '0'],
      ['1', '1', '0', '1', '0', '1', '1', '1', '0', '1', '1', '1'],
      ['0', '1', '0', '1', '1', '1', '0', '0', '0', '0', '1', '1'],
      ['1', '0', '0', '0', '1', '0', '1', '1', '0', '0', '1', '0'],
      ['0', '1', '0', '0', '1', '0', '0', '1', '1', '0', '1', '1'],
      ['1', '1', '1', '0', '1', '1', '1', '0', '0', '0', '1', '0'],
      ['0', '1', '0', '1', '0', '0', '0', '1', '0', '0', '0', '1'],
      ['1', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '1']]
    common = 'most'

    binary_report = Task003a.bit_criteria(binary_diagnostic_report, common)

    expect(binary_report).to eq('100000101101')
  end

  it ' 5 short numbers in raport and common: most' do
    binary_diagnostic_report = [['1', '0'], ['0', '1'], ['0', '0'], ['1', '1'], ['0', '1']]
    common = 'most'

    binary_report = Task003a.bit_criteria(binary_diagnostic_report, common)

    expect(binary_report).to eq('01')
  end

  it ' 5 mixed numbers in raport and common: most' do
    binary_diagnostic_report = [['1', '0', '0', '0', '0', '0', '1', '0', '1', '1', '0', '1'],
      ['0', '1', '1', '0', '1', '1', '0', '1'],
      ['0', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '0'],
      ['1', '1', '0', '1'],
      ['0', '1', '0', '1', '1', '1', '0', '0', '0', '0', '1', '1']]
    common = 'most'

    binary_report = Task003a.bit_criteria(binary_diagnostic_report, common)

    expect(binary_report).to eq('01101101')
  end

  it ' 10 numbers in raport and common: least' do
    binary_diagnostic_report = [['1', '0', '0', '0', '0', '0', '1', '0', '1', '1', '0', '1'],
      ['0', '1', '1', '0', '1', '1', '0', '1', '0', '1', '0', '1'],
      ['0', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '0'],
      ['1', '1', '0', '1', '0', '1', '1', '1', '0', '1', '1', '1'],
      ['0', '1', '0', '1', '1', '1', '0', '0', '0', '0', '1', '1'],
      ['1', '0', '0', '0', '1', '0', '1', '1', '0', '0', '1', '0'],
      ['0', '1', '0', '0', '1', '0', '0', '1', '1', '0', '1', '1'],
      ['1', '1', '1', '0', '1', '1', '1', '0', '0', '0', '1', '0'],
      ['0', '1', '0', '1', '0', '0', '0', '1', '0', '0', '0', '1'],
      ['1', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '1']]
    common = 'least'

    binary_report = Task003a.bit_criteria(binary_diagnostic_report, common)

    expect(binary_report).to eq('000000111000')
  end

  it ' 5 short numbers in raport and common: least' do
    binary_diagnostic_report = [['1', '0'], ['0', '1'], ['0', '0'], ['1', '1'], ['0', '1']]
    common = 'least'

    binary_report = Task003a.bit_criteria(binary_diagnostic_report, common)

    expect(binary_report).to eq('10')
  end

  it ' 5 mixed numbers in raport and common: least' do
    binary_diagnostic_report = [['1', '0', '0', '0', '0', '0', '1', '0', '1', '1', '0', '1'],
      ['0', '1', '1', '0', '1', '1', '0', '1'],
      ['0', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '0'],
      ['1', '1', '0', '1'],
      ['0', '1', '0', '1', '1', '1', '0', '0', '0', '0', '1', '1']]
    common = 'least'

    binary_report = Task003a.bit_criteria(binary_diagnostic_report, common)

    expect(binary_report).to eq('100000101101')
  end
end

RSpec.describe 'calculate_life_support_rating(input_data):' do # RSpec. not neccecery
  it '0 numbers in diagnostic report' do
    input_data = <<~INPUT
    INPUT

    life_support_rating = Task003a.calculate_life_support_rating(input_data)

    expect(life_support_rating).to eq(0)
  end

  it 'only 1 number in diagnostic report' do
    input_data = <<~INPUT
      100000101101
    INPUT

    life_support_rating = Task003a.calculate_life_support_rating(input_data)

    expect(life_support_rating).to eq(4_380_649)
  end

  it '2 numbers in diagnostic report' do
    input_data = <<~INPUT
      100000101101
      011011010101
    INPUT

    life_support_rating = Task003a.calculate_life_support_rating(input_data)

    expect(life_support_rating).to eq(3_660_657)
  end

  it '5 numbers in diagnostic report' do
    input_data = <<~INPUT
      100000101101
      011011010101
      000000111000
      110101110111
      110000001100
    INPUT

    life_support_rating = Task003a.calculate_life_support_rating(input_data)

    expect(life_support_rating).to eq(193_032)
  end

  it '20 numbers in diagnostic report' do
    input_data = <<~INPUT
      100000101101
      011011010101
      000000111000
      110101110111
      110000001100
      010111000011
      100010110010
      010010011011
      111011100010
      010100010001
      100000010011
      100000111100
      101110000100
      100000001000
      001111100101
      001000000010
      101001110010
      010111011111
      110110111000
      111100110001
    INPUT

    life_support_rating = Task003a.calculate_life_support_rating(input_data)

    expect(life_support_rating).to eq(118_048)
  end
end
