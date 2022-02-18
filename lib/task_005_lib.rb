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

    def ==(other)
      self.class === other &&
        @x == other.x &&
        @y == other.y
    end

    alias eql? ==

    def hash
      @x.hash ^ @y.hash
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

    def horizontal_or_vertical?
      horizontal? || vertical?
    end

    def degree_45?
      (@point1.x - @point2.x).abs == (@point1.y - @point2.y).abs
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

    private

    def horizontal?
      @point1.y == @point2.y
    end

    def vertical?
      @point1.x == @point2.x
    end

    def horizontal_range
      beginning, ending = [@point1.x, @point2.x].sort
      beginning..ending
    end

    def vertical_range
      beginning, ending = [@point1.y, @point2.y].sort
      beginning..ending
    end

    def points_on_horizontal_or_vertical
      horizontal_range.flat_map do |x|
        vertical_range.map do |y|
          Point.new(x, y)
        end
      end
    end

    def points_on_degree_45
      x = @point1.x - @point2.x < 0 ? horizontal_range.to_a : horizontal_range.to_a.reverse
      y = @point1.y - @point2.y < 0 ? vertical_range.to_a : vertical_range.to_a.reverse
      x.zip(y).map { |x, y| Point.new(x, y) }
    end
  end

  class Diagram
    def initialize(diagram = {})
      @diagram = diagram
    end

    def mark_line(line)
      line.points_on_line.each { |point| cover_point(point) }
    end

    def count_points_with_min_coverage
      @diagram.count { |_point, coverage| coverage >= 2 }
    end

    private

    def cover_point(point)
      @diagram.key?(point) ? @diagram[point] += 1 : @diagram.store(point, 1)
    end
  end

  def parse_input(input_data)
    input_data.split("\n").map { |input| Line.from_input(input) }
  end
end
