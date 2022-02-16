require './lib/task_005_lib'

RSpec.describe Task005 do
  describe 'parse_input(input_data)' do
    it ' parses input data ' do
      input = <<~INPUT
        0,9 -> 5,9
        8,0 -> 0,8
        9,4 -> 3,4
      INPUT

      lines = Task005.parse_input(input)

      expect(lines).to contain_exactly(
        have_attributes(
          point1: have_attributes(x: 0, y: 9),
          point2: have_attributes(x: 5, y: 9),
        ),
        have_attributes(
          point1: have_attributes(x: 8, y: 0),
          point2: have_attributes(x: 0, y: 8),
        ),
        have_attributes(
          point1: have_attributes(x: 9, y: 4),
          point2: have_attributes(x: 3, y: 4),
        ),
      )
    end
  end
end

RSpec.describe Task005::Line do
  describe 'horizontal_or_vertical?' do
    context 'when the line is vertical' do
      it 'returns true' do
        point1 = Task005::Point.new(2, 4)
        point2 = Task005::Point.new(2, 6)
        line = Task005::Line.new(point1, point2)

        reply = line.horizontal_or_vertical?

        expect(reply).to eq(true)
      end
    end

    context 'when the line is horizontal' do
      it 'returns true' do
        point1 = Task005::Point.new(1, 4)
        point2 = Task005::Point.new(2, 4)
        line = Task005::Line.new(point1, point2)

        reply = line.horizontal_or_vertical?

        expect(reply).to eq(true)
      end
    end

    context 'when the line is no horizontal and no vertical' do
      it 'returns false' do
        point1 = Task005::Point.new(1, 3)
        point2 = Task005::Point.new(2, 4)
        line = Task005::Line.new(point1, point2)

        reply = line.horizontal_or_vertical?

        expect(reply).to eq(false)
      end
    end
  end

  describe 'degree_45?' do
    context 'when the line is 45 degree' do
      it 'return true' do
        point1 = Task005::Point.new(2, 4)
        point2 = Task005::Point.new(12, 14)
        line = Task005::Line.new(point1, point2)

        reply = line.degree_45?

        expect(reply).to eq(true)
      end
    end

    context 'when the line is no 45 degree' do
      it 'return false' do
        point1 = Task005::Point.new(1, 4)
        point2 = Task005::Point.new(2, 4)
        line = Task005::Line.new(point1, point2)

        reply = line.degree_45?

        expect(reply).to eq(false)
      end
    end
  end

  describe 'points_on_line' do
    context 'horizontal line' do
      it 'create array of point covered by line' do
        point1 = Task005::Point.new(2, 4)
        point2 = Task005::Point.new(2, 6)
        line = Task005::Line.new(point1, point2)

        points = line.points_on_line

        expect(points).to eq([[2, 4], [2, 5], [2, 6]])
      end
    end

    context '45 degree line' do
      it 'create array of point covered by line' do
        point1 = Task005::Point.new(2, 4)
        point2 = Task005::Point.new(4, 6)
        line = Task005::Line.new(point1, point2)

        points = line.points_on_line

        expect(points).to eq([[2, 4], [3, 5], [4, 6]])
      end
    end
  end
end

RSpec.describe Task005::Diagram do
  describe 'mark_horizontal_and_vertical(lines) :' do
    it 'create diagram with points covered by horizontal and vertical lines' do
      input = <<~INPUT
        0,9 -> 5,9
        8,0 -> 0,8
        6,4 -> 3,4
        2,7 -> 12,1
      INPUT

      lines = Task005.parse_input(input)

      diagram = Task005::Diagram.new
      diagram.mark_horizontal_and_vertical(lines)

      expect(diagram.diagram).to eq(
        {
          [0, 9] => 1,
          [1, 9] => 1,
          [2, 9] => 1,
          [3, 9] => 1,
          [4, 9] => 1,
          [5, 9] => 1,
          [3, 4] => 1,
          [4, 4] => 1,
          [5, 4] => 1,
          [6, 4] => 1,
        },
      )
    end
  end

  describe 'mark_horizontal_vertical_45_degree(lines) :' do
    it 'create diagram with points covered by horizontal, vertical and 45 degree lines' do
      input = <<~INPUT
        0,9 -> 2,9
        2,0 -> 0,2
        4,4 -> 3,4
        2,7 -> 12,1
      INPUT

      lines = Task005.parse_input(input)

      diagram = Task005::Diagram.new
      diagram.mark_horizontal_vertical_45_degree(lines)

      expect(diagram.diagram).to eq(
        {
          [0, 2] => 1,
          [0, 9] => 1,
          [1, 1] => 1,
          [1, 9] => 1,
          [2, 0] => 1,
          [2, 9] => 1,
          [3, 4] => 1,
          [4, 4] => 1,
        },
      )
    end
  end
end
