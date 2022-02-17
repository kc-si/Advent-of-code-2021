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
  describe '#horizontal_or_vertical?' do
    context ': when the line is vertical' do
      it 'returns true' do
        point1 = Task005::Point.new(2, 4)
        point2 = Task005::Point.new(2, 6)
        line = Task005::Line.new(point1, point2)

        reply = line.horizontal_or_vertical?

        expect(reply).to eq(true)
      end
    end

    context ': when the line is horizontal' do
      it 'returns true' do
        point1 = Task005::Point.new(1, 4)
        point2 = Task005::Point.new(2, 4)
        line = Task005::Line.new(point1, point2)

        reply = line.horizontal_or_vertical?

        expect(reply).to eq(true)
      end
    end

    context ': when the line is no horizontal and no vertical' do
      it 'returns false' do
        point1 = Task005::Point.new(1, 3)
        point2 = Task005::Point.new(2, 4)
        line = Task005::Line.new(point1, point2)

        reply = line.horizontal_or_vertical?

        expect(reply).to eq(false)
      end
    end
  end

  describe '#degree_45?' do
    context ': when the line is 45 degree' do
      it 'return true' do
        point1 = Task005::Point.new(2, 4)
        point2 = Task005::Point.new(12, 14)
        line = Task005::Line.new(point1, point2)

        reply = line.degree_45?

        expect(reply).to eq(true)
      end
    end

    context ': when the line is no 45 degree' do
      it 'return false' do
        point1 = Task005::Point.new(1, 4)
        point2 = Task005::Point.new(2, 4)
        line = Task005::Line.new(point1, point2)

        reply = line.degree_45?

        expect(reply).to eq(false)
      end
    end
  end

  describe '#points_on_line' do
    context ': when horizontal line' do
      it 'it create array of point covered by line' do
        point1 = Task005::Point.new(2, 4)
        point2 = Task005::Point.new(2, 6)
        line = Task005::Line.new(point1, point2)

        points = line.points_on_line

        expect(points).to contain_exactly(
          have_attributes(x: 2, y: 4),
          have_attributes(x: 2, y: 5),
          have_attributes(x: 2, y: 6),
        )
      end
    end

    context ': when 45 degree line' do
      it 'it create array of point covered by 45 degree line' do
        point1 = Task005::Point.new(2, 4)
        point2 = Task005::Point.new(4, 6)
        line = Task005::Line.new(point1, point2)

        points = line.points_on_line

        expect(points).to contain_exactly(
          have_attributes(x: 2, y: 4),
          have_attributes(x: 3, y: 5),
          have_attributes(x: 4, y: 6),
        )
      end
    end
  end
end
