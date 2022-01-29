require './lib/task_004.rb'

RSpec.describe "parse_input(input_data) - input data processing:" do
  it " short input_data puzzle_input" do
    input_data = "7,4,9,5,11,17,23,2,0,14,21,24,10,16,13,6,15,25,12,22,18,20,8,19,3,26,1\n22 13 17 11  0\n
    21  9 14 16  7\n6 10  3 18  5\n1 12 20 15 19\n3 15  0  2 22\n9 18 13 17  5\n19  8  7 25 23\n20 11 10 24  4\n
    14 21 16 12  6\n14 21 17 24  4\n10 16 15  9 19\n18  8 23 26 20\n22 11 13  6  5\n2  0 12  3  7"

    puzzle_input = parse_input(input_data)
    binding.breake
    expect(puzzle_input).to eq( [[7,4,9,5,11,17,23,2,0,14,21,24,10,16,13,6,15,25,12,22,18,20,8,19,3,26,1],
     [[22, 13, 17, 11, 0],[8, 2, 23, 4, 24],[21, 9, 14, 16, 7],[6, 10, 3, 18, 5],[1, 12, 20, 15, 19]],
     [[3, 15, 0, 2, 22],[9, 18, 13, 17, 5],[19, 8, 7, 25, 23],[20, 11, 10, 24, 4],[14, 21, 16, 12, 6]],
     [[14, 21, 17, 24, 4],[10, 16, 15, 9, 19],[18, 8, 23, 26, 20],[22, 11, 13, 6, 5],[2, 0, 12, 3, 7]]] )
  end
end

# RSpec.describe "bit_criteria - calculate one output number by bit criteria:" do    # RSpec. not neccecery
#   it " with empty inputs" do
#     binary_diagnostic_report = [[""]]
#     common = ""

#     binary_report = bit_criteria(binary_diagnostic_report, common)

#     expect(binary_report).to eq("")
#   end

#   it " with empty raport and common: most" do
#     binary_diagnostic_report = [[""]]
#     common = "most"

#     binary_report = bit_criteria(binary_diagnostic_report, common)

#     expect(binary_report).to eq("")
#   end

#   it " 1 number in raport and common: most" do
#     binary_diagnostic_report = [["1", "0", "0", "0", "0", "0", "1", "0", "1", "1", "0", "1"]]
#     common = "most"

#     binary_report = bit_criteria(binary_diagnostic_report, common)

#     expect(binary_report).to eq("100000101101")
#   end

#   it " 2 numbers in raport and common: most" do
#     binary_diagnostic_report = [["1", "0", "0", "0", "0", "0", "1", "0", "1", "1", "0", "1"],
#     ["0", "1", "1", "0", "1", "1", "0", "1", "0", "1", "0", "1"]]
#     common = "most"

#     binary_report = bit_criteria(binary_diagnostic_report, common)

#     expect(binary_report).to eq("100000101101")
#   end

#   it " 10 numbers in raport and common: most" do
#     binary_diagnostic_report = [["1", "0", "0", "0", "0", "0", "1", "0", "1", "1", "0", "1"],
#     ["0", "1", "1", "0", "1", "1", "0", "1", "0", "1", "0", "1"],
#     ["0", "0", "0", "0", "0", "0", "1", "1", "1", "0", "0", "0"],
#     ["1", "1", "0", "1", "0", "1", "1", "1", "0", "1", "1", "1"],
#     ["0", "1", "0", "1", "1", "1", "0", "0", "0", "0", "1", "1"],
#     ["1", "0", "0", "0", "1", "0", "1", "1", "0", "0", "1", "0"],
#     ["0", "1", "0", "0", "1", "0", "0", "1", "1", "0", "1", "1"],
#     ["1", "1", "1", "0", "1", "1", "1", "0", "0", "0", "1", "0"],
#     ["0", "1", "0", "1", "0", "0", "0", "1", "0", "0", "0", "1"],
#     ["1", "0", "0", "0", "0", "0", "0", "1", "0", "0", "1", "1"]]
#     common = "most"

#     binary_report = bit_criteria(binary_diagnostic_report, common)

#     expect(binary_report).to eq("100000101101")
#   end

#   it " 5 short numbers in raport and common: most" do
#     binary_diagnostic_report = [["1", "0"], ["0", "1"],["0", "0"], ["1", "1"], ["0", "1"]]
#     common = "most"

#     binary_report = bit_criteria(binary_diagnostic_report, common)

#     expect(binary_report).to eq("01")
#   end

#   it " 5 mixed numbers in raport and common: most" do
#     binary_diagnostic_report = [["1", "0", "0", "0", "0", "0", "1", "0", "1", "1", "0", "1"],
#     ["0", "1", "1", "0", "1", "1", "0", "1"],
#     ["0", "0", "0", "0", "0", "0", "1", "1", "1", "0", "0", "0"],
#     ["1", "1", "0", "1"],
#     ["0", "1", "0", "1", "1", "1", "0", "0", "0", "0", "1", "1"]]
#     common = "most"

#     binary_report = bit_criteria(binary_diagnostic_report, common)

#     expect(binary_report).to eq("01101101")
#   end

#   it " 10 numbers in raport and common: least" do
#     binary_diagnostic_report = [["1", "0", "0", "0", "0", "0", "1", "0", "1", "1", "0", "1"],
#     ["0", "1", "1", "0", "1", "1", "0", "1", "0", "1", "0", "1"],
#     ["0", "0", "0", "0", "0", "0", "1", "1", "1", "0", "0", "0"],
#     ["1", "1", "0", "1", "0", "1", "1", "1", "0", "1", "1", "1"],
#     ["0", "1", "0", "1", "1", "1", "0", "0", "0", "0", "1", "1"],
#     ["1", "0", "0", "0", "1", "0", "1", "1", "0", "0", "1", "0"],
#     ["0", "1", "0", "0", "1", "0", "0", "1", "1", "0", "1", "1"],
#     ["1", "1", "1", "0", "1", "1", "1", "0", "0", "0", "1", "0"],
#     ["0", "1", "0", "1", "0", "0", "0", "1", "0", "0", "0", "1"],
#     ["1", "0", "0", "0", "0", "0", "0", "1", "0", "0", "1", "1"]]
#     common = "least"

#     binary_report = bit_criteria(binary_diagnostic_report, common)

#     expect(binary_report).to eq("000000111000")
#   end

#   it " 5 short numbers in raport and common: least" do
#     binary_diagnostic_report = [["1", "0"], ["0", "1"],["0", "0"], ["1", "1"], ["0", "1"]]
#     common = "least"

#     binary_report = bit_criteria(binary_diagnostic_report, common)

#     expect(binary_report).to eq("10")
#   end

#   it " 5 mixed numbers in raport and common: least" do
#     binary_diagnostic_report = [["1", "0", "0", "0", "0", "0", "1", "0", "1", "1", "0", "1"],
#     ["0", "1", "1", "0", "1", "1", "0", "1"],
#     ["0", "0", "0", "0", "0", "0", "1", "1", "1", "0", "0", "0"],
#     ["1", "1", "0", "1"],
#     ["0", "1", "0", "1", "1", "1", "0", "0", "0", "0", "1", "1"]]
#     common = "least"

#     binary_report = bit_criteria(binary_diagnostic_report, common)

#     expect(binary_report).to eq("100000101101")
#   end
# end

# RSpec.describe "calculate_life_support_rating(input_data):" do    # RSpec. not neccecery
#   it "0 numbers in diagnostic report" do
#     input_data = <<~INPUT
#     INPUT

#     life_support_rating = calculate_life_support_rating(input_data)

#     expect(life_support_rating).to eq(0)
#   end

#   it "only 1 number in diagnostic report" do
#     input_data = <<~INPUT
#       100000101101
#     INPUT

#     life_support_rating = calculate_life_support_rating(input_data)

#     expect(life_support_rating).to eq(4380649)
#   end

#   it "2 numbers in diagnostic report" do
#     input_data = <<~INPUT
#       100000101101
#       011011010101
#     INPUT

#     life_support_rating = calculate_life_support_rating(input_data)

#     expect(life_support_rating).to eq(3660657)
#   end

#   it "5 numbers in diagnostic report" do
#     input_data = <<~INPUT
#       100000101101
#       011011010101
#       000000111000
#       110101110111
#       110000001100
#     INPUT

#     life_support_rating = calculate_life_support_rating(input_data)

#     expect(life_support_rating).to eq(193032)
#   end

#   it "20 numbers in diagnostic report" do
#     input_data = <<~INPUT
#       100000101101
#       011011010101
#       000000111000
#       110101110111
#       110000001100
#       010111000011
#       100010110010
#       010010011011
#       111011100010
#       010100010001
#       100000010011
#       100000111100
#       101110000100
#       100000001000
#       001111100101
#       001000000010
#       101001110010
#       010111011111
#       110110111000
#       111100110001
#     INPUT

#     life_support_rating = calculate_life_support_rating(input_data)

#     expect(life_support_rating).to eq(118048)
#   end
# end
