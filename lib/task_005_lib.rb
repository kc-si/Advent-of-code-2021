module Task005
  module_function

  class Point
    attr_reader :x, :y

    def self.from_input(point)
      x, y = point.split(',').map(&:to_i)
      Point.new(x, y)
    end

    def initialize(x, y)
      @x = x
      @y = y
    end
  end

  class Line
    attr_reader :point1, :point2

    def self.from_input(input)
      point1, point2 = input.split(' -> ').map { |point| Point.from_input(point) }
      Line.new(point1, point2)
    end

    def initialize(point1, point2)
      @point1 = point1
      @point2 = point2
    end

    def horizontal?
      @point1.y == @point2.y
    end

    def vertical?
      @point1.x == @point2.x
    end

    def horizontal_or_vertical?
      horizontal? || vertical?
    end

    def degree_45?
      (@point1.x - @point2.x).abs == (@point1.y - @point2.y).abs
    end

    def points_on_horizontal_or_vertical
      x1, x2 = [@point1.x, @point2.x].sort
      y1, y2 = [@point1.y, @point2.y].sort
      (x1..x2).flat_map do |x|
        (y1..y2).map do |y|
          [x, y]
        end
      end
    end

    def points_on_degree_45
      x1, x2 = [@point1.x, @point2.x].sort
      y1, y2 = [@point1.y, @point2.y].sort

      x = @point1.x - @point2.x < 0 ? (x1..x2).each.to_a : (x1..x2).each.to_a.reverse
      y = @point1.y - @point2.y < 0 ? (y1..y2).each.to_a : (y1..y2).each.to_a.reverse
      x.each_with_index.map { |x, i| [x, y[i]] }
    end

    def points_on_line
      if horizontal_or_vertical?
        points_on_horizontal_or_vertical
      elsif degree_45?
        points_on_degree_45
      else
        raise NotImplementedError, 'The lines other than horizontal/vertical/45 degree are not supported yet!'
      end
    end
  end

  class Diagram
    attr_reader :diagram

    def initialize(diagram = {})
      @diagram = diagram
    end

    def cover_point(point)
      @diagram.key?(point) ? @diagram[point] += 1 : @diagram.store(point, 1)
    end

    def mark_line(line)
      line.points_on_line.each { |point| cover_point(point) }
    end

    def mark_horizontal_and_vertical(lines)
      lines.each { |line| mark_line(line) if line.horizontal_or_vertical? }
    end

    def mark_horizontal_vertical_45_degree(lines)
      lines.each do |line|
        mark_line(line) if line.horizontal_or_vertical? || line.degree_45?
      end
    end

    def count_values_greater_than_2
      @diagram.count { |_key, value| value >= 2 }
    end
  end

  def parse_input(input_data)
    input_data.split("\n").map { |input| Line.from_input(input) }
  end
end
