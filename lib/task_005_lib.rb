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

    def horizontal_or_vertical?
      @point1.x == @point2.x || @point1.y == @point2.y
    end

    def degree_45?
      (@point1.x - @point2.x).abs == (@point1.y - @point2.y).abs
    end

    def points_on_line
      if horizontal_or_vertical?
        points = []
        x1, x2 = [@point1.x, @point2.x].sort
        y1, y2 = [@point1.y, @point2.y].sort
        (x1..x2).each do |x|
          (y1..y2).each do |y|
            points << [x, y]
          end
        end
      elsif degree_45?
        points = []
        x1, x2 = [@point1.x, @point2.x].sort
        y1, y2 = [@point1.y, @point2.y].sort

        x = @point1.x - @point2.x < 0 ? (x1..x2).each.to_a : (x1..x2).each.to_a.reverse
        y = @point1.y - @point2.y < 0 ? (y1..y2).each.to_a : (y1..y2).each.to_a.reverse

        x.size.times do |i|
          points << [x[i], y[i]]
        end
      end
      points
    end
  end

  class Diagram
    attr_accessor :diagram

    def initialize(diagram = {})
      @diagram = diagram
    end

    def mark_line(line)
      line.points_on_line.each do |x, y|
        @diagram.key?([x, y]) ? @diagram[[x, y]] += 1 : @diagram.store([x, y], 1)
      end
    end

    def mark_horizontal_and_vertical(lines)
      lines.each { |line| line.horizontal_or_vertical? ? mark_line(line) : nil }
      @diagram
    end

    def mark_horizontal_vertical_45_degree(lines)
      lines.each do |line|
        line.horizontal_or_vertical? ? mark_line(line) : nil
        line.degree_45? ? mark_line(line) : nil
      end
      @diagram
    end
  end

  def parse_input(input_data)
    input_data.split("\n").map { |input| Line.from_input(input) }
  end
end
